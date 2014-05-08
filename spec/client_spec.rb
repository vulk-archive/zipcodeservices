require 'zipcodeservices'
require 'spec_helper'

describe "client" do 

  before(:each) do
    ZipCodeServices.apikey = 'YOUR_API_HERE'
  end

  it "should retrieve zip code info", :vcr, record: :new_episodes do 
    zips = ZipCodeServices.zipcode("78702") 
    zips.first[1]["City"].should == "Austin" 
    # test other item 
  end

  it "should get zip codes in radius of zip code", :vcr,  record: :new_episodes do
    zips = ZipCodeServices.radius(78702, 1)
    zips.first[1].first["PostalCode"].should == "78701"
  end

  it "should get zip codes in radius of latitude and longitude", :vcr,  record: :new_episodes do
    zips = ZipCodeServices.radius_by_latlong("30.2645715", "-97.7284341", 1)
    zips.first[1].first["PostalCode"].should == "73301"
  end

  it "should get the distance between zip codes", :vcr,  record: :new_episodes do
    zips = ZipCodeServices.distance_between_zipcodes("78702", "01109")
    zips.first[1]["DistanceAwayInMiles"].should == 1616.501295
  end


  it "should get countries", :vcr,  record: :new_episodes do
    countries = ZipCodeServices.countries
    countries.first[1].first["Abbreviation"].should == "US"
  end

  it "should get states / provinces by country id (country id attained by request to countries list)", :vcr,  record: :new_episodes do
    states = ZipCodeServices.states(1)
    states.first[1].first["Abbreviation"].should == "AL"
  end

  it "should get cities by province id / provinces id (country id attained by request to states list)", :vcr,  record: :new_episodes do
    cities = ZipCodeServices.cities(200)
    cities.first[1].first["City"].should == "Alamo"
  end

  it "should get cities by state id (provinces id) and country id (country id attained by request for country list, province id attained by request for states list)", :vcr,  record: :new_episodes do
    cities = ZipCodeServices.cities_by_state_and_country(1, 1)
    cities.first[1][20]["City"].should == "Arlington"
  end

end
