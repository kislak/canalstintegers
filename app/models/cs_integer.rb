# encoding: utf-8

class CsInteger < ActiveRecord::Base
  acts_as_api

  attr_accessible :celebrity_name, :celebrity_screen_name, :origin, :origin_url

  validates :celebrity_name, :presence => true
  validates :celebrity_screen_name, :presence => true
  validates :origin, :presence => true
  validates :origin_url, :presence => true
  validates_uniqueness_of :id

  def description
    "A #{adjective} integer \##{id} as used by #{celebrity_name} on #{origin}"
  end

  def adjective
    words = %w[
      contemporary
      fashionable
      trendy
      très\ chic
      modern
      in\ vogue
      popular
      swank
      dapper
      dashing
      voguish
      all-the-rage
      hot
      in\ style
      trendsetting
    ]
    #
    # We seed the prng with id to ensure we always get the same random value for each id!
    #
    words.sample(random: Random.new(id))
  end

  api_accessible :basic_info do |template|
    template.add :id
    template.add :description
    template.add :celebrity_name
    template.add :celebrity_screen_name
    template.add :origin_url
  end

  # Create new integer from a tweet object, automatically handle errors and
  # log status messages to STDOUT.
  #
  # For when you just don't give a shit!
  #
  # tweet - a Twitter::Tweet object
  #
  # Returns an Integer representing how many CSInts were created (probably 1 or 0).
  def self.ui_create_from_tweet_wrapper(tweet)
    begin
      create_from_tweet(tweet)
      puts "+++ seeded INTEGER #{tweet.id} (as used by #{tweet.user.name} on Twitter)"
      return 1
    rescue CsIntegerAlreadyExistsError
      puts "--- INTEGER #{tweet.id} (as used by #{tweet.user.name}) already exists"
      return 0
    end
  end

  # Safely create a CsInteger from a tweet.
  #
  # tweet - a Twitter::Tweet object
  #
  # Returns the new CsInteger object.
  # Raises CsIntegerAlreadyExistsError if tweet ID is already taken by a CsInt.
  def self.create_from_tweet(tweet)
    twurl = "http://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
    safe_create(
      tweet.id,
      tweet.user.name,
      tweet.user.screen_name,
      'Twitter',
      twurl
    )
  end

  # Create a new CsInteger, basically a replacement for default Create.
  # Handles all the weird workarounds we're doing to insert AR objects with a custom ID.
  #
  # id - the Integer id, must be unique.
  # celebrity_name - String for the human readable name of celebrity.
  # celebrity_screen_name - String for the server screen name for celebrity.
  # origin - String for the social network or service.
  # origin_url - String representing the URL of the origin source.
  #
  # Returns the new CsInteger generated
  # Raises CsIntegerAlreadyExistsError if a CSInt already exists with that ID.
  def self.safe_create(csid, celebrity_name, celebrity_screen_name, origin, origin_url)
    if CsInteger.exists? csid
      raise CsIntegerAlreadyExistsError
    else
      # note: don't use #create since id is attr_protected
      csi = CsInteger.new( 
        :celebrity_name => celebrity_name,
        :celebrity_screen_name => celebrity_screen_name,
        :origin => origin,
        :origin_url => origin_url
      )
      csi.id = csid #likewise, need to set id seperately here
      csi.save!
      return csi
    end
  end

end

class CsIntegerAlreadyExistsError < Exception
end
