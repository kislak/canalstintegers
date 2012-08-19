#!/usr/bin/env ruby

require 'twitter'

namespace :integers do

  desc "Import at most N=1 entries per celebrity from twitter to the db"
  task :trickle => :environment do
    File.open('config/twitter_celebs.txt').each do |celeb|
      begin
        Twitter.user_timeline( celeb ).slice(0,1).each do |t|
          CsInteger.ui_create_from_tweet_wrapper(t)
        end
      rescue Twitter::Error::Unauthorized
        puts "Got Unauthorized error from twitter trying to read #{celeb}"
      end
    end
  end

  desc "Give the current integer count"
  task :count => :environment do
    puts CsInteger.count
  end

end
