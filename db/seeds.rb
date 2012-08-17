# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open('config/twitter_celebs.txt').each do |celeb|
  begin
    Twitter.user_timeline( celeb ).each do |t|

      if CsInteger.exists? t.id
        puts "--- INTEGER #{t.id} (as used by #{t.user.name}) already exists"
      else
        puts "+++ seeding INTEGER #{t.id} (as used by #{t.user.name} on Twitter)"
        url = "http://twitter.com/#{t.user.screen_name}/status/#{t.id}"
        # note: don't use #create since id is attr_protected
        csi = CsInteger.new( 
          :celebrity_name => t.user.name,
          :celebrity_screen_name => t.user.screen_name,
          :origin => 'Twitter',
          :origin_url => url
        )
        csi.id = t.id #likewise, need to set id seperately here
        csi.save!
      end
    end
  rescue Twitter::Error::Unauthorized
    puts "Got Unauthorized error from twitter trying to read #{celeb}"
  end
end
