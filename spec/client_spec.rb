require 'zipcodeservices'
require 'spec_helper'

describe "client" do 

  before(:each) do
    ZipCodeServices.base_uri = 'https://www.zipcodeservices.com/services/rest/json/zipcodes.svc'
    ZipCodeServices.apikey = 'YOURAPIKEYHERE'
  end

  it "should retrieve zip code info", :vcr, record: :new_episodes do 
    zips = ZipCodeServices.zipcode("78702") 
    zips.first[1]["City"].should == "Austin" 
    # test other item 
  end

  #it "should get the distance between zip codes", :vcr,  record: :new_episodes do
  #  zips = ZipCodeServices.distance_between_zipcodes("78702", "78750")
  #  zips.first[1] == "cheese"
  #end
end
