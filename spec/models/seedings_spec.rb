require 'spec_helper'

describe "Seeding database stuff" do
  it "can add a new entry directly from a tweet object" do
    tweet = double("Twitter::Tweet")
    tweet.stub(:id) { 12345654321 }
    twuser = double("Twitter::User")
    twuser.stub(:name) { "Stuart the Dog" }
    twuser.stub(:screen_name) { "stuartdog" }
    tweet.stub(:user) { twuser }

    csi = CsInteger.create_from_tweet(tweet)
    csi.should be_a(CsInteger)
    csreloaded = CsInteger.find( tweet.id )
    csreloaded.should be_a(CsInteger)
    csreloaded.id.should == csi.id

    csi.celebrity_name.should == twuser.name
    csi.celebrity_screen_name.should == twuser.screen_name
  end

  it "wont add a duplicate entry" do
  end
end
