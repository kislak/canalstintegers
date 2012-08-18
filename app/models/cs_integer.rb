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
      fashionable
      trendy
    ]
    words.sample
  end

  api_accessible :basic_info do |template|
    template.add :id
    template.add :description
    template.add :celebrity_name
    template.add :celebrity_screen_name
    template.add :origin_url
  end

end
