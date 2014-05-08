# Require the necessary files
%w[
  rubygems
  typhoeus
].each { |r| require r }

module ZipCodeServices
  @base_uri = 'https://www.zipcodeservices.com/services/rest/json' #/zipcodes.svc'

  class << self; 
    #attr_accessor :base_uri 
    attr_accessor :apikey

    def zipcode(zip) 
      #/{apikey}/{zipcode}
      response = Typhoeus::Request.get( "#{@base_uri}/zipcodes.svc/#{apikey}/#{zip}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j.first[1]["City"] == nil 
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def radius(zip, rad)
      response = Typhoeus::Request.get( "#{@base_uri}/zipcodes.svc/#{apikey}/#{zip}/#{rad}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j["RetrieveZipCodesInRadiusResult"] == nil 
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def radius_by_latlong(lat, lon, rad)
      response = Typhoeus::Request.get( "#{@base_uri}/zipcodes.svc/GetZipCodesInRadiusLatLong?apikey=#{apikey}&latitude=#{lat}&longitude=#{lon}&radius=#{rad}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j["GetZipCodesInRadiusOfLatLongResult"] == nil 
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def distance_between_zipcodes(zip1, zip2) 
      response = Typhoeus::Request.get( "#{@base_uri}/zipcodes.svc/GetDistanceBetweenZipCodes?apikey=#{apikey}&zipcode1=#{zip1}&zipcode2=#{zip2}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j.first[1]["ZipCode1"] == nil 
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def countries
      response = Typhoeus::Request.get( "#{@base_uri}/countries.svc/#{apikey}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j["GetCountriesResult"] == nil 
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def states(country_id)
      response = Typhoeus::Request.get( "#{@base_uri}/provinces.svc/#{apikey}/#{country_id}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j["GetAllProvincesByCountryIdResult"] == nil 
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end
    alias :provinces :states

    def cities(province_id)
      #/{apikey}/{zipcode}
      response = Typhoeus::Request.get( "#{@base_uri}/cities.svc/#{apikey}/#{province_id}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j["GetCitiesByProvinceResult"] == nil 
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def cities_by_state_and_country(province_id, country_id)
      response = Typhoeus::Request.get( "#{@base_uri}/cities.svc/#{apikey}/#{province_id}/#{country_id}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j["GetCitiesByProvinceAndCountryResult"] == nil # NOTE: also happens when a province id is not valid for a country
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def ipaddress(ip)
      response = Typhoeus::Request.get( "#{@base_uri}/ipaddress.svc/GetIP?apikey=#{apikey}&ip=#{ip}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j["RetrieveIPAddressDataResult"] == nil # NOTE: also happens when a province id is not valid for a country
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def ipaddress_radius(ip, rad)
      response = Typhoeus::Request.get( "#{@base_uri}/ipaddress.svc/GetZipsInRadiusOfIP?apikey=#{apikey}&ip=#{ip}&radius=#{rad}") 
      if response.code == 200 
        j = JSON::parse(response.body)
        raise "BAD API KEY" if j["RetrieveZipCodesInRadiusOfIPResult"] == nil # NOTE: also happens when a province id is not valid for a country
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end
  end 
end

