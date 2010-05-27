require File.dirname(__FILE__) + '/spec_helper'

describe "foursquare" do
  it "should do nothing" do
    true.should == true
  end
  
  describe "Base" do
    
    before :each do
      oauth_key = 'oingo'
      oauth_secret = 'boingo'
      @oauth = Foursquare::OAuth.new(oauth_key, oauth_secret)
    end
    
    describe "#to_query_params" do
      before :each do 
        @foursquare = Foursquare::Base.new(@oauth)
      end
      
      it "should encode whitespace" do
        @foursquare.to_query_params(:q => 'hello world').should == 'q=hello%20world'
      end
      it "should handle URLs as params" do
        @foursquare.to_query_params(:q => 'http://www.google.com?q=hello%20world').should == 'q=http%3A%2F%2Fwww.google.com%3Fq%3Dhello%2520world'        
      end
      it "should handle nil values" do
        @foursquare.to_query_params(:q => nil).should == 'q='
      end
    end
  end
end