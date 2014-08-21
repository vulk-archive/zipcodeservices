require 'ipaddressservices'
require 'spec_helper'

IpAddressServices.apikey = 	ENV['ZIP_CODE_SERVICES_API_KEY'] 


describe "json client" do 
  before(:each) do
    IpAddressServices.data_format = :json
  end

  it "should retrieve ip address info", :vcr, record: :all do 
    zips = IpAddressServices.get_ip_address("184.98.179.3") 
		zips.first[1]["City"].should == "Phoenix" 
    # test other item 
  end

  it "should get zip codes in radius of ip address", :vcr,  record: :all do
    zips = IpAddressServices.zip_codes_in_radius_of_ip("184.98.179.3", 1)
	 	zips.first[1].first["PostalCode"].should == "86323"
  end
end

describe "xml client" do 
  before(:each) do
    IpAddressServices.data_format = :xml
  end

  it "should retrieve ip address info", :vcr, record: :all do 
    zips = IpAddressServices.get_ip_address("184.98.179.3") 
		zips.first[1].first[1]["City"].should == "Phoenix" 
    # test other item 
  end

  it "should get zip codes in radius of ip address", :vcr,  record: :all do
    zips = IpAddressServices.zip_codes_in_radius_of_ip("184.98.179.3", 1)
	 	zips.first[1].first[1].first[1]["PostalCode"].should == "86323"
  end
end
