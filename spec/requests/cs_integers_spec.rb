require 'spec_helper'

describe "CsIntegers" do
  describe "GET /integer" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cs_integers_path
      response.status.should be(200)
    end
  end

  describe "POST /integer" do
    fixtures :cs_integers

    it "should load fixtures" do
      CsInteger.count.should be(2)
    end

    it "should create and redirect on web" do
      post cs_integers_path
      response.status.should be(302)
    end

    it "should create successfully via API" do
      post cs_integers_path, :format => :json
      response.status.should be(201)
      #headers
      #response.body.should == 
    end
  end

end
