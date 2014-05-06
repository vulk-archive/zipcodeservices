require 'rspec'
#require 'webmock/rspec'

RSpec.configure do |config|
  config.mock_with :rspec
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate

  #WebMock.disable_net_connect!(:allow => 'coveralls.io')

  #RSpec.configure do |config|
  #  config.expect_with :rspec do |c|
  #    c.syntax = :expect
  #  end
  #end

  #def a_delete(path)
  #  a_request(:delete, ZipCodeServices::base_uri + path)
  #end

  #def a_get(path)
  #  a_request(:get, ZipCodeServices::base_uri + path)
  #end

  #def a_post(path)
  #  a_request(:post, ZipCodeServices::base_uri + path)
  #end

  #def a_put(path)
  #  a_request(:put, ZipCodeServices::base_uri + path)
  #end

  #def stub_delete(path)
  #  stup_request(:delete, ZipCodeServices::base_uri + path)
  #end

  #def stub_get(path)
  #  stup_request(:get, ZipCodeServices::base_uri + path)
  #end

  #def stub_post(path)
  #  stup_request(:post, ZipCodeServices::base_uri + path)
  #end

  #def stub_put(path)
  #  stup_request(:put, ZipCodeServices::base_uri + path)
  #end


end
