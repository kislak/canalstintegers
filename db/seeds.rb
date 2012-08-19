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
      begin
        CsInteger.create_from_tweet(t)
        puts "+++ seeded INTEGER #{t.id} (as used by #{t.user.name} on Twitter)"
      rescue CsIntegerAlreadyExistsError
        puts "--- INTEGER #{t.id} (as used by #{t.user.name}) already exists"
      end
    end
  rescue Twitter::Error::Unauthorized
    puts "Got Unauthorized error from twitter trying to read #{celeb}"
  end
end
