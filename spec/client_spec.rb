require 'zipcodeservices'
require 'spec_helper'

ZipCodeServices.apikey = 	ENV['ZIP_CODE_SERVICES_API_KEY'] 

describe "json client" do 
  before(:each) do
    ZipCodeServices.data_format = :json
  end

  it "should retrieve zip code info", :vcr, record: :all do 
    zips = ZipCodeServices.zipcode("78702") 
    zips.first[1]["City"].should == "Austin" 
    # test other item 
  end

  it "should get zip codes in radius of zip code", :vcr,  record: :all do
    zips = ZipCodeServices.radius(78702, 1)
    zips.first[1].first["PostalCode"].should == "78701"
  end

  it "should get zip codes in radius of latitude and longitude", :vcr,  record: :all do
    zips = ZipCodeServices.radius_by_latlong("30.2645715", "-97.7284341", 1)
    zips.first[1].first["PostalCode"].should == "73301"
  end

  it "should get the distance between zip codes", :vcr,  record: :all do
    zips = ZipCodeServices.distance_between_zipcodes("78702", "01109")
    zips.first[1]["DistanceAwayInMiles"].should == 1616.501295
  end


  it "should get countries", :vcr,  record: :all do
    countries = ZipCodeServices.countries
    countries.first[1].first["Abbreviation"].should == "US"
  end

  it "should get states-provinces by country id", :vcr,  record: :all do
    states = ZipCodeServices.states(1)
		states.first[1].first["Abbreviation"].should == "AL"
  end

  it "should get cities by state id (province id)", :vcr,  record: :all do
    cities = ZipCodeServices.cities(200)
		cities.first[1].first["City"].should == "Alamo"
  end

  it "should get cities by state id (provinces id) and country id", :vcr,  record: :all do
    cities = ZipCodeServices.cities_by_state_and_country(1, 1)
    cities.first[1][20]["City"].should == "Arlington"
  end

  it "should return information on ip addresses", :vcr, record: :all do 
    data = ZipCodeServices.ipaddress("184.98.179.3")
    data.first[1]["ZipCode"].should == "85001"
  end

  it "should return zips in radius of ip address", :vcr, record: :all do 
    data = ZipCodeServices.ipaddress_radius("184.98.179.3", 1)
    data.first[1].first["PostalCode"].should == "86323"
  end
end


describe "xml client" do 
  before(:each) do
    ZipCodeServices.data_format = :xml
  end

  it "should retrieve zip code info", :vcr, record: :all do 
    zips = ZipCodeServices.zipcode("78702") 
    zips.first[1].first[1]["City"].should == "Austin"
  end

  it "should get zip codes in radius of zip code", :vcr,  record: :all do
    zips = ZipCodeServices.radius(78702, 1)
    zips.first[1].first[1].first[1].first["PostalCode"].should == "78701"
  end

  it "should get zip codes in radius of latitude and longitude", :vcr,  record: :all do
    zips = ZipCodeServices.radius_by_latlong("30.2645715", "-97.7284341", 1)
    zips.first[1]["GetZipCodesInRadiusOfLatLongResult"]["ZipCodeWithDistanceDTO"][0]["PostalCode"].should == "73301"
  end

  it "should get the distance between zip codes", :vcr,  record: :all do
    zips = ZipCodeServices.distance_between_zipcodes("78702", "01109")
    zips.first[1]["RetrieveDistanceBetweenZipCodesResult"]["DistanceAwayInMiles"].should == "1616.501295"
  end

	it "should get countries", :vcr,  record: :all do
    countries = ZipCodeServices.countries
    countries.first[1].first[1].first[1][0]["Abbreviation"].should == "US"
  end

  it "should get states-provinces by country id", :vcr,  record: :all do
    states = ZipCodeServices.states(1)
    states.first[1].first[1].first[1][0]["Abbreviation"].should == "AL"
  end

  it "should get cities by state id (province id)", :vcr,  record: :all do
    cities = ZipCodeServices.cities(200)
		cities.first[1].first[1].first[1][0]["City"].should == "Alamo"
  end

  it "should get cities by state id (provinces id) and country id", :vcr,  record: :all do
    cities = ZipCodeServices.cities_by_state_and_country(1, 1)
    cities.first[1].first[1].first[1][20]["City"].should == "Arlington"
  end

  it "should return information on ip addresses", :vcr, record: :all do 
    data = ZipCodeServices.ipaddress("184.98.179.3")
    data.first[1].first[1]["ZipCode"].should == "85001"
  end

  it "should return zips in radius of ip address", :vcr, record: :all do 
    data = ZipCodeServices.ipaddress_radius("184.98.179.3", 1)
    data.first[1].first[1].first[1]["PostalCode"].should == "86323"
  end
end
