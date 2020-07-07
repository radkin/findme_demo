
class Common
  attr_accessor :raw_multi_query_results

  def initialize
    @raw_multi_query_results = raw_multi_query_results
  end

  # accepts a hash of hashes and removes duplcate values
  def dedupe(raw_multi_query_results)
    puts "let the dedupe begin!"
  end

  def concat_dupes
    puts "let the concatination begin!"
  end
end
