# gem 'minitest', '-> 5.14'
require 'minitest/autorun'
require_relative '../lib/user_provided_information'

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

  def test_create_search_query
    @user_pi = UserProvidedInformation.new.import_PI()
    puts(@user_pi)

  end

end
