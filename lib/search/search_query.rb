# frozen_string_literal: true

class SearchQuery
  def initialize(user_pi, type)
    @user_pi  = user_pi
    @type     = type
  end

  def construct
    case @type
    when 'full_name_query'
      full_name_query = "#{@user_pi['firstName']}+#{@user_pi['lastName']}"
      full_name_query
    else
      puts 'Invalid query type'
    end
  end
end
