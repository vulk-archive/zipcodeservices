Zipcode Services.
=================

This is a ruby library that interfaces [Zip Code Services](https://www.zipcodeservices.com/) -- a IP Address and Zip Code database with Zip Code Distance Search and IP Address Distance Search APIs available to members.

---

## Installation 

```
gem install zipcodeservices
```

Use
```
ZipCodeServices.apikey = 'YOUR_ZIP_CODE_SERVICES_API_KEY'
ZipCodeServices.data_format = :json
zips = ZipCodeServices.zipcode("78702") 
```

## Contribution

Installation for contributors

 1. Get an api key from zipcodeservices.com
 2. Fork the repo
 3. Add the API key as the environment variable ZIP_CODE_SERVICES_API_KEY
    - Linux:
      * First -- add ```ZIP_CODE_SERVICES_API_KEY=YOUR_KEY``` to .env
      * Next -- Type ```. .env``` before running any tests
    - Windows: Add your environment variables using the following instructions: http://www.computerhope.com/issues/ch000549.htm
 4. Ensure all tests pass by running ```rspec spec```
 5. Submit a pull request with your changes

Please write tests for any changes you make or we will have our way with you
 
## LICENSE


Licensed under [MIT](http://vulk.mit-license.org/)
