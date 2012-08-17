require 'test_helper'

class CsIntegerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "can create with a custom id using method in dbseed" do
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
    csi = CsInteger.new( 
        :celebrity_name => "Stuart Rothenberg",
        :celebrity_screen_name => "Stuart Dog",
        :origin => 'twitter',
        :origin_url => "http://twitterisdumb.lol"
      )
    csi.id = 236137192987193344 #likewise, need to set id seperately here
    csi.save!
    csi_reloaded = CsInteger.find(236137192987193344)
    assert_equal csi_reloaded.id, 236137192987193344
  end
  
end
