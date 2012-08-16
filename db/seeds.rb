# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open('config/twitter_celebs.txt').each do |celeb|
  Twitter.user_timeline( celeb ).each do |t|
    puts "seeding INTEGER #{t.id} (as used by #{t.user.name} on Twitter)"
    url = "http://twitter.com/#{t.user.screen_name}/status/#{t.id}"

    CsInteger.create( 
      :id => t.id,
      :celebrity_name => t.user.name,
      :celebrity_screen_name => t.user.screen_name,
      :origin => 'twitter',
      :origin_url => url
    )
  end
end
