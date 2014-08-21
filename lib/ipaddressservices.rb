# Require the necessary files
%w[
  rubygems
  typhoeus
  multi_xml
].each { |r| require r }

module IpAddressServices
  @base_uri = 'https://www.zipcodeservices.com/services/rest' #/json' #/zipcodes.svc'
  #MultiXml.parser = :ox
  MultiXml.parser = :nokogiri

  class << self; 
    attr_accessor :data_format
    attr_accessor :apikey

    def base_uri
      fmt = data_format == :xml ? 'xml' : 'json'
      "#{@base_uri}/#{fmt}"
    end
	
    def get_ip_address(ipaddress) 
      #/{apikey}/{ipadderss}
      response = Typhoeus::Request.get( "#{base_uri}/ipaddress.svc/GetIP?apikey=#{apikey}&ip=#{ipaddress}") 
			if response.code == 200 
        if data_format == :xml
          j = MultiXml.parse(response.body)
          raise "BAD API KEY" if j.first[1].first[1]["City"] == nil
        else
          j = JSON::parse(response.body)
          raise "BAD API KEY" if j.first[1]["City"] == nil 
        end
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end

    def zip_codes_in_radius_of_ip(ipaddress, rad)
      response = Typhoeus::Request.get( "#{base_uri}/ipaddress.svc/GetZipsInRadiusOfIP?apikey=#{apikey}&ip=#{ipaddress}&radius=#{rad}") 
			if response.code == 200 
        if data_format == :xml
          j = MultiXml.parse(response.body)
				 	raise "BAD API KEY" if j.first[1].first[1].first[1]["PostalCode"] == nil
        else
          j = JSON::parse(response.body)
          raise "BAD API KEY" if j["RetrieveZipCodesInRadiusOfIPResult"] == nil 
        end
        j
      elsif response.code == 404
        nil 
      else 
        raise response.body 
      end 
    end
	end
end
