# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../../lib/parse/startpage'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ParserTest < Minitest::Test
  def setup
    @stubbed_html = File.read('./test/stubs/startpage_search.html')

    @stubbed_startpage_all_links = {"direct"=>["https://en.wikipedia.org/wiki/Jane_Smith", "https://en.wikipedia.org/wiki/Jane_Smith", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b775548554264464647596846785268736556426f7053446c435542416452526f7363686c5653437333536a746245455979626c55745a53456a4677513053335a485552554152516c314d455a425477346b45324e5155425a42525178365a455a4648673931526a52514145644d516c496e5a4667454356414e64775548657a413146486f58515151394855687a5a3355426356494856416c33596b6c4253567833476a4e5455554647526c45684e6b635454313177456d514442424a435167496e4e31674545676774526d315755424956555667334a67344443564278&ek=4s583577656q3141493141794r5852304n445244&ekdata=50a1aa228b4b9e0e4bbede330a3e53fb", "https://en.wikipedia.org/wiki/Sarah_Jane_Smith", "https://en.wikipedia.org/wiki/Sarah_Jane_Smith", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b775548554264464647596846785268736556426f7053446c435542416452526f7363686c5653437333536a74624545597964315578595259764d4177755267396857423041544249325a4238454731416b5232525544556441457764324d3067545346703246575a5556685641465146304e45744253316b6b45585a47526b6b3563474632546a6f7853694d555969702f556c46485942467752466744436c423051576344426b5644485663695a4574434741676946576c5241455245465142794d5268474846736b46485a475852455a51516b6e5a5267524477453042534242526b6c46&ek=4s583577656q3141493141794r5852304n445244&ekdata=6783be21ea82e50769ee55d876834671", "https://www.facebook.com/public/Jane-Smith", "https://www.facebook.com/public/Jane-Smith", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b7755485542644646475968467852676b4844554d6d516a4e585678736254786f6762784e5653437377566a4a6558426452466e494a59524156567a3474536952614577455152554169505238565167386a477a5941413063514567636d5a427753486c7834456d4a5841307842485646305a42704158426b7a4868316d594545365948567a54696f784143416e426d4e3245456377416b637a50556f535456787a456d634c56685551455159685a5278475177353145324144415556465167496c4e68704858426b6f526a315843424152516c5532624170574368347a486d453d&ek=4s583577656q3141493141794r5852304n445244&ekdata=3ec08ff1c2db07cbe2a66dd17ba55aec", "https://www.imdb.com/name/nm1056558/", "https://www.imdb.com/name/nm1056558/", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b7755485542644646475968467852676b4844554d70546a52514778636253524678526841524677686c45525a635745564545514a324e555a565343746d566a52545152564a46774e794e3035475351776d527a454341524a43455164784d5268425446306945444d4b413051534551316c6441314e4e7a6b5646683532644551366348553554526c5653536c6c454251555267524a45465a304d5531425456516a516a51484278595252674a3659307441536c7830456d465541784a4351414e6c6442595646776839527a5655564145595542497a6377314e53773d3d&ek=4s583577656q3141493141794r5852304n445244&ekdata=13b8ec62f23ebe3372b0248c56b4daa6", "https://www.youtube.com/watch?v=pRPjHfcB8oQ", "https://www.youtube.com/watch?v=pRPjHfcB8oQ", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b7755485542644646475968467852676b4844554d355443564751425952436c63736256744350426f68567a4e614545637955684677524134694b67634952544e774452736c416b456e59516f5252777834527a454842684647515649684d5278424751776d5147494c41524644455163685a52394453566b694253524243446b676351454e524439414e446b425752315645456377415163484a67304152316b694647454242454e4e5231556e4e55775348773932476a4d4842555246454156795a6b675754416c334253526155426b524756416d5a68384646686c6d55794e424345553d&ek=4s583577656q3141493141794r5852304n445244&ekdata=671898e85653c6daf17c022890612235", "https://www.youtube.com/channel/UCQoWOuO_hQvCxl6K8hFctoQ", "https://www.youtube.com/channel/UCQoWOuO_hQvCxl6K8hFctoQ", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b7755485542644646475968467852676b4844554d355443564751425952436c6373625674435041346f516a356355426852466e4957517938664c534931624139615a41493358466831533059595041343054414555514241565546562b5952784853566c335232634642526351527763694f42735348463930454452525578564e45464a794e687057446835396267526e41446f775a51514e5644384b4e77706c45425158426a42535630522b4e4278485331357846476c5256424242466c596d596b684a475668774532454742455553456c4a315a456c574467556c546a55505552455352554576644667414352353945673d3d&ek=4s583577656q3141493141794r5852304n445244&ekdata=43a603101db979478a5dd4fe48c3ad14", "https://tardis.fandom.com/wiki/Sarah_Jane_Smith", "https://tardis.fandom.com/wiki/Sarah_Jane_Smith", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b7755485542644646475968467852676f5243416b705548355556426f5153316c74597845645831384756446c5a58464647596d6369636838594a536368545456745a686b645546786c64526f5244677839457a494441306356484642774d7830575441787747324d44554242465267516c4d42735554466878463249555151644a615741574e5441304f31304f6478464965424e524633426d4d7a705743523139467a49464245644645773067595270465341386c5157594c566b4645464156334d5538575441743252326355515277525356462b5a4273574778677356335a435267644a46513d3d&ek=4s583577656q3141493141794r5852304n445244&ekdata=abab903ce652bcb509af548180df2258", "https://tardis.fandom.com/wiki/The_Wedding_of_Sarah_Jane_Smith_(TV_story)", "https://tardis.fandom.com/wiki/The_Wedding_of_Sarah_Jane_Smith_(TV_story)", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b7755485542644646475968467852676f5243416b705548355556426f5153316c74597845645831384756446c5a58464647596d41725a53456e48776b6b536a35566168735365326369636838594a536368545456745a686b64554677634a5578494c6a736655435264527731524667316c64526f5244677839457a594655455557454146374d6b6f5354313869455456524245644548464a7a4d6b5a4953777369454445555151644a615741574e5441304f31304f6478464965424e524633426d4d7a705743523139467a49464245644645773067595270465341386c5157594c566b4645464156334d5538575441743252326355515277525356462b5a4273574778677356335a435267644a46513d3d&ek=4s583577656q3141493141794r5852304n445244&ekdata=b4612d961ec2526251f08a9f3f2da472", "https://janesmithagency.com/", "https://janesmithagency.com/", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b77554855426446464759684678526851524641677a546a6c475852555451566f67655641544651426c45525955514241565546562b4d6b6c49536c743546445944445530535156416c5a6870485356676b4654565441524242484663694e423157446835396267526e41446f775a51514e5644384b4e77706c45425158426a42535630522b4e4278485331357846476c5256424242466c596d596b684a475668774532454742455553456c4a315a456c574467556c546a55505552455352554576644667414352353945673d3d&ek=4s583577656q3141493141794r5852304n445244&ekdata=bff4c16622d9715d40d8ec13cbdd5d4b", "https://www.bbcamerica.com/anglophenia/2011/11/a-companion-to-the-doctors-companions-sarah-jane-smith", "https://www.bbcamerica.com/anglophenia/2011/11/a-companion-to-the-doctors-companions-sarah-jane-smith", "https://us-browse.startpage.com/av/proxy?ep=576b4d5948457373486a5663556867645631786c64554d5944686b7755485542644646475968467852676b4844554d6951544e5457424547545663694c683066463068795a544663556867625646776d62686352583138474557414442464647596756794a5577324730416a5444314356426f6453317075644246644467556c446a526456674162566b64755978456443677775536a3963526c6b485255596961464d6147774d6c44694e6658414163416b456e59516f52523152314732634b424549524577636c4e555a49483174784632414455454d5345776477595268425346357a4253524243446b676351454e524439414e446b425752315645456377415163484a67304152316b694647454242454e4e5231556e4e55775348773932476a4d4842555246454156795a6b675754416c334253526155426b524756416d5a68384646686c6d55794e424345553d&ek=4s583577656q3141493141794r5852304n445244&ekdata=761f239aaa140e9952fb02d11b0bd4a3", "https://add.startpage.com/?source=serp"], "search_queries"=>[]}

    @startpage = Startpage.new(@stubbed_html)
  end

  def test_parser
    assert_equal @stubbed_startpage_all_links, @startpage.gather_all_links
  end

end
