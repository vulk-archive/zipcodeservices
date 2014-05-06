# Require the necessary files
%w[
  rubygems
  typhoeus
].each { |r| require r }
module ZipCodeServices
  
  class << self; 
    attr_accessor :base_uri 
    attr_accessor :apikey

    def zipcode(zip) 
      #/{apikey}/{zipcode}
      response = Typhoeus::Request.get( "#{base_uri}/#{apikey}/#{zip}") 
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
  end 
end

