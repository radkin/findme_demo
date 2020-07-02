# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/reporters'

require_relative '../bin/findme.rb'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

# end to end test
class EverythingTest < Minitest::Test
  # let's make sure the first result is valid
  def test_findme_binary
    findme = Findme.new
    results = findme.main
    results.each do |key, value|
      assert value.length >= 1
    end
  end
end
