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
 
## License

[The MIT License (MIT)](http://vulk.mit-license.org)

Copyright (c) 2014 Vulk <[wolfpack@vulk.co](mailto:wolfpack@vulk.co)>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
