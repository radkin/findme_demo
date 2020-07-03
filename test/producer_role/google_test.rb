require 'minitest/autorun'

require_relative './search_engine_interface_test'
require_relative '../../lib/parse/google'

@query_result = ""

class GoogleTest < MiniTest::Test
  include SearchEngineInterfaceTest

  def setup
    @google = @object = Google.new(@query_result)
  end

  # other tests that rely on google

end
