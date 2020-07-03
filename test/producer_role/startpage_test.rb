require 'minitest/autorun'

require_relative './search_engine_interface_test'
require_relative '../../lib/parse/startpage'

@query_result = ""

class StartpageTest < MiniTest::Test
  include SearchEngineInterfaceTest

  def setup
    @startpage = @object = Startpage.new(@query_result)
  end

  # other tests that rely on startpage

end
