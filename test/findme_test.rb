# gem 'minitest', '-> 5.14'
require 'minitest/autorun'
require_relative '../lib/user_provided_information'

class UserProvidedInformationTest < Minitest::Test
  def test_import
    testJSON = {
      "firstName"=>"jane",
      "lastName"=>"smith",
      "emailAddress"=>"jsmith@anon.com",
      "street"=>"anon", "apartment"=>"1",
      "city"=>"anonville",
      "state"=>"North Anon",
      "zipCode"=>"99999",
      "phoneNumber"=>"5555555555"
    }
    user_pi = UserProvidedInformation.new.importPI()
    assert_equal user_pi, testJSON
  end

end
