require 'spec_helper'

describe "CsIntegers" do
  csint = FactoryGirl.create(:cs_integer)

  describe "GET /integer" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cs_integers_path
      response.status.should be(200)
    end
  end

  describe "POST /integer" do
    
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

  describe "GET /integer/:id" do

    it "should load a page for a proper id" do
      get cs_integer_path(csint)
      response.status.should be(200)
    end

    it "should provide additional response formats in json and xml" do
      get cs_integer_path(csint), :format => :json
      response.status.should be(200)
      response.content_type.should eq('application/json')

      get cs_integer_path(csint), :format => :xml
      response.status.should be(200)
      response.content_type.should eq('application/xml')
    end

    it "should error if an improper ID" do
      get cs_integer_path('xyz123abc')
      response.status.should be(404)
    end

  end

end
