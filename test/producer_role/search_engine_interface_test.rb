require 'minitest/autorun'

module SearchEngineInterfaceTest
  def test_implements_the_search_engine_interface
    assert_respond_to(@object, :gather_all_links)
  end
end
