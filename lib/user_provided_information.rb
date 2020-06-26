# frozen_string_literal: true

class UserProvidedInformation
  require 'json'

  def initialize; end

  def import_PI
    file = File.read('./config/user_pi.json')
    @user_pi = JSON.parse(file)
    @user_pi
  end
end
