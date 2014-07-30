Zipcode Services.
==
Zip Code Services is an IP Address and Zip Code database with Zip Code Distance Search and IP Address Distance Search APIs available to members.
===

Installation 
```
gem install zipcodeservices
```

Use
```
ZipCodeServices.apikey = ENV['ZIP_CODE_SERVICES_API_KEY']
ZipCodeServices.data_format = :json
zips = ZipCodeServices.zipcode("78702") 
```

==

Installation for contributors

 1) Get an api key from zipcodeservices.com
 2) Fork the repo
 3) Add the API key as the environment variable ZIP_CODE_SERVICES_API_KEY
    - Linux:
      * First -- add ```ZIP_CODE_SERVICES_API_KEY=YOUR_KEY``` to .env
      * Next -- Type ```. .env``` before running any tests
    - Windows: Add your environment variables using the following instructions: http://www.computerhope.com/issues/ch000549.htm
 4) Ensure all tests pass by running ```rspec spec```
 5) Submit a pull request with your changes

Please write tests for any changes you make or we will have our way with you
 


