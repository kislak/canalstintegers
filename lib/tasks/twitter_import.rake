#!/usr/bin/env ruby

require 'twitter'

namespace :twitter do

  desc "Import from twitter to seed the db"
  task :seed => :environment do
    File.open('twitter_celebs.txt').each do |celeb|
      Twitter.user_timeline( celeb ).each do |t|
        puts "INTEGER #{t.id} (as used by #{t.user.name} on Twitter)"
        url = "http://twitter.com/#{t.user.screen_name}/status/#{t.id}"

        CSInteger.create( 
          :id => t.id,
          :celebrity_name => t.user.name,
          :celebrity_screen_name => t.user.screen_name,
          :origin => 'twitter',
          :origin_url => url
        )
      end
    end
  end
  
end
