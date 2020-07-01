# frozen_string_literal: true

# read user provided information from a file for our searches
class UserProvidedInformation
  require 'json'

  def initialize; end

  def import_PI
    file = File.read('./config/user_pi.json')
    @user_pi = JSON.parse(file)
    @user_pi
  end
end
