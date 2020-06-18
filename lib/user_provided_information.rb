class UserProvidedInformation

  require 'rest-client'
  require 'json'

  def initialize()
  end

  def import_PI()
    file = File.read('./config/user_pi.json')
    @user_pi = JSON.parse(file)
    return @user_pi
  end

end
