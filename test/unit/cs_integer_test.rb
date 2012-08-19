require 'test_helper'

class CsIntegerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "can create with a custom id using method in dbseed" do
    #TODO: this is deprecated, remove?
    csi = CsInteger.new( 
        :celebrity_name => "Stuart Rothenberg",
        :celebrity_screen_name => "Stuart Dog",
        :origin => 'twitter',
        :origin_url => "http://twitterisdumb.lol"
      )
    csi.id = 1979 #likewise, need to set id seperately here
    csi.save!
    csi_reloaded = CsInteger.find(1979)
    assert_equal csi_reloaded.id, 1979
  end

  test "can insert a 64bit integer as id" do
    xid = 236137192987193344
    csi = CsInteger.safe_create(xid,"Name","ScreenName","Twitter","http://twitter.lol")
    assert_equal xid, csi.id
    csi_reloaded = CsInteger.find(xid)
    assert_equal csi, csi_reloaded
  end

  test "wont insert duplicates" do
    before_count = CsInteger.count
    xid = 236137192987193332
    CsInteger.safe_create(xid,"Name","ScreenName","Twitter","http://twitter.lol")
    assert_equal CsInteger.count, before_count+1
    assert_raise(CsIntegerAlreadyExistsError) do
      CsInteger.safe_create(xid,"Name","ScreenName","Twitter","http://twitter.lol")
    end
    assert_equal CsInteger.count, before_count+1
  end

  test "should always return the same adjective for an integer" do
    csi = CsInteger.first
    first_adj = csi.adjective
    5.times do
      assert_equal first_adj, csi.adjective
    end
  end
  
end
