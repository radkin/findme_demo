require 'minitest/autorun'
require 'minitest/reporters'

require_relative './search_engine_interface_test'
require_relative '../../lib/parse/bing'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

@query_result = ""

class BingTest < MiniTest::Test
  include SearchEngineInterfaceTest

  def setup
    @bing = @object = Bing.new(@query_result)
  end

  # other tests that rely on bing

end
