# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../../lib/parse/bing'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ParserTest < Minitest::Test
  def setup
    @stubbed_html = File.read('./test/stubs/bing_search.html')

    @stubbed_bing_all_links = {"direct"=>["https://www.imdb.com/name/nm1056558/", "https://www.facebook.com/public/Jane-Smith", "https://daysofourlives.fandom.com/wiki/Jane_Smith", "https://www.youtube.com/watch?v=50yP32OrTmw", "https://www.youtube.com/watch?v=aiqivup81r8", "https://www.youtube.com/watch?v=bfpUBOOWFnY", "https://www.youtube.com/watch?v=q-taSJiH4uY", "https://www.youtube.com/watch?v=4hs9FJqBFVM", "https://www.telegraph.co.uk/obituaries/2020/06/29/jane-parker-smith-virtuoso-organist-brought-glamour-insight/", "https://en.wikipedia.org/wiki/Jane_Parker-Smith", "https://www.flickr.com/photos/stockingsjane", "https://en-gb.facebook.com/public/Jane-Smith", "https://www.youtube.com/channel/UCX_tRv8Wy7FfLgh4-DveM4Q", "https://en.wikipedia.org/wiki/Jean_Kennedy_Smith", "https://en.wikipedia.org/wiki/Jean_Kennedy_Smith"], "search_queries"=>["jane+smith&FORM=HDRSC2", "jane+smith&FORM=HDRSC3", "jane+smith&FORM=HDRSC6", "Jane+Smith", "jane+smith&qpvt=jane+smith&FORM=IGRE", "Maria+Jane+Smith&FORM=IARSLK", "Mary+Jane+Smith&FORM=IARSLK", "Jane+Smith+Flickr&FORM=IARSLK", "Jane+Smith+Facebook&FORM=IARSLK", "Ayeeshia+Jane+Smith&FORM=IARSLK", "Actress+Jane+Smith&FORM=IARSLK", "Jane+Shirley+Smith&FORM=IARSLK", "Laura+Jane+Smith&FORM=IARSLK", "Jane+Smith+Flexible&FORM=IARSLK", "Ruby+Jane+Smith&FORM=IARSLK", "Martha+Jane+Smith&FORM=IARSLK", "Jane+Smith+Instagram&FORM=IARSLK", "Jolie+Jane+Smith&FORM=IARSLK", "Jane+Smith+OTR&FORM=IARSLK", "Morgan+Jane+Smith&FORM=IARSLK", "Doctor+Who+Sarah+Jane+Smith&FORM=IARSLK", "Vimeo+Jane+Smith&FORM=IARSLK", "Monica+Jane+Smith&FORM=IARSLK", "Jane+Smith+Writer+Bio&FORM=IARSLK", "Jane+Smith+in+Ft.+Worth&FORM=IARSLK", "jane+smith&id=02CAA49D1C251011B183BC0E3E8CED300CA77E6C&FORM=IQFRBA", "jane+smith&id=00DE63ADBEA7CBF1E9384C32DC73BEBD4FC00061&FORM=IQFRBA", "jane+smith&id=BE83A8B90FF9949F76AE4EE1F0C615781D3A1DD9&FORM=IQFRBA", "jane+smith&id=2E941781B7C3C32C2EAF41398A21AAD554D58A6F&FORM=IQFRBA", "jane+smith&id=70230269E3497026A83C1D78C5302248F12B6CC5&FORM=IQFRBA", "jane+smith&qpvt=jane+smith&FORM=IQFRML", "jane+smith&qpvt=jane+smith&FORM=IQFRML", "jane+smith&qpvt=jane+smith&FORM=VDRE", "jane+smith&FORM=VDRESM", "jane+smith+instagram&FORM=QSRE1", "jane+smith+lottery+strategies&FORM=QSRE2", "jane+smith+agency&FORM=QSRE3", "jane+smith+lottery+youtube&FORM=QSRE4", "jane+smith+medical+associates&FORM=QSRE5", "facebook+jane+smith&FORM=QSRE6", "sarah+jane+smith&FORM=QSRE7", "dr+who+sarah+jane+smith&FORM=QSRE8", "jane+smith&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&first=11&FORM=PERE", "jane+smith&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&first=21&FORM=PERE1", "jane+smith&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&first=31&FORM=PERE2", "jane+smith&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&first=41&FORM=PERE3", "jane+smith&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&first=11&FORM=PORE", "jane+smith&filters=ufn%3a%22jane+smith%22+sid%3a%22f7ee1f5e-70fa-d85e-9616-cdcc2535ca8c%22&FORM=SNAPST", "jane+smith+field+hockey&filters=ufn%3a%22jane+smith+field+hockey%22+sid%3a%224f42dd17-b344-41b3-8d62-d98890c32421%22&FORM=SNAPST", "Jane+Smith&filters=ufn%3a%22Jane+Smith%22+sid%3a%22d5c64dcb-3a38-1bb7-20e5-4e27f97a5386%22&FORM=SNAPST", "jane+smith&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&qpvt=jane+smith", "jane+smith&filters=ex1%3a%22ez1%22&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&qpvt=jane+smith", "jane+smith&filters=ex1%3a%22ez2%22&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&qpvt=jane+smith", "jane+smith&filters=ex1%3a%22ez3%22&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD&qpvt=jane+smith", "jane+smith&filters=ex1%3a%22ez5_18084_18449%22&toWww=1&redig=8A5BA221D22B487C94DF8A2ED2C2CBFD"]}
    @bing = Bing.new(@stubbed_html)
  end

  def test_parser
    assert_equal @stubbed_bing_all_links, @bing.gather_all_links
  end

end
