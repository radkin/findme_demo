# gem 'minitest', '-> 5.14'
require 'minitest/autorun'
require_relative '../lib/user_provided_information'
# require_relative '../lib/search/search_query'
require_relative '../lib/search/search_client'

class UserProvidedInformationTest < Minitest::Test
  def test_import_userpi_template
    @testJSON = {
      "firstName"=>"jane",
      "lastName"=>"smith",
      "emailAddress"=>"jsmith@anon.com",
      "street"=>"anon", "apartment"=>"1",
      "city"=>"anonville",
      "state"=>"North Anon",
      "zipCode"=>"99999",
      "phoneNumber"=>"5555555555"
    }
    @user_pi = UserProvidedInformation.new.import_PI()
    assert_equal @user_pi, @testJSON
  end

  # def test_create_google_search_client
  #   client = SearchClient.new
  #   if client
  #     puts "client has been initialized"
  #   else
  #     puts "something went wrong"
  #   end
  # end

end
