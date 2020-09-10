# frozen_string_literal: true

class GoogleAllLinks
  def provider
    stubbed_google_all_links = { 'direct' => ['https://maps.google.com/maps?q=jane+smith&um=1&ie=UTF-8&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_AUICygE', '/imgres?imgurl=https://upload.wikimedia.org/wikipedia/en/thumb/0/0e/Sarah_Jane_Smith_2006.jpg/200px-Sarah_Jane_Smith_2006.jpg&imgrefurl=https://en.wikipedia.org/wiki/Sarah_Jane_Smith&h=279&w=200&tbnid=RHxaJbv9LVmJ_M&q=jane+smith&tbnh=265&tbnw=190&usg=AI4_-kQQwU1LzU1_Cgr33p83zodiWWVrrw&vet=1&docid=Hs4CGoC0SAbVZM&itg=1&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ9QF6BAgUEAQ', '/imgres?imgurl=https://media.wired.com/photos/5933bfb9a88f414d9a8c957c/master/w_610,c_limit/UNSET-1.jpeg&imgrefurl=https://www.wired.com/2010/11/whatever-happened-to-doctor-whos-sarah-jane-smith/&h=800&w=610&tbnid=jiAu3Fu9qRVTVM&q=jane+smith&tbnh=257&tbnw=196&usg=AI4_-kQr5qdizCjJ6W3k2aVOCXoyI3yoUQ&vet=1&docid=xjO9zxMmoozLVM&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ9QF6BAgUEAY', '/imgres?imgurl=https://vignette.wikia.nocookie.net/tardis/images/3/3f/48.jpg/revision/latest/top-crop/width/360/height/450?cb%3D20110725212102&imgrefurl=https://tardis.fandom.com/wiki/The_Temptation_of_Sarah_Jane_Smith_(TV_story)&h=450&w=360&tbnid=hGFSAXlDL3SBVM&q=jane+smith&tbnh=251&tbnw=201&usg=AI4_-kRUQQiYTHumx7U-1frDhTCY2RPfxw&vet=1&docid=mILSA8pbbGDtuM&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ9QF6BAgUEAg', '/imgres?imgurl=https://vignette.wikia.nocookie.net/tardis/images/7/7f/SarahJaneSmirkTHOF.jpg/revision/latest?cb%3D20130920034858&imgrefurl=https://tardis.fandom.com/wiki/Sarah_Jane_Smith&h=656&w=992&tbnid=d1TkSEnUEb7KdM&q=jane+smith&tbnh=182&tbnw=276&usg=AI4_-kQvyGi_aMuy7MgGnwFMf5BLsX_wgQ&vet=1&docid=seKxbNX6ESfFUM&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ9QF6BAgUEAo', '/url?q=https://en.wikipedia.org/wiki/Sarah_Jane_Smith&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQmhMwB3oECBQQDg&usg=AOvVaw0VkZbE1ACz3jqL1SRUE8Fd', '/url?q=https://en.wikipedia.org/wiki/Jane_Smith&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjAQegQICRAB&usg=AOvVaw0A9N3IunJRSeXgjGPS8PRJ', '/url?q=https://www.facebook.com/public/Jane-Smith&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjARegQIBRAB&usg=AOvVaw3lCaGGtSTRxJwIUbYDvSk3', 'https://maps.google.com/maps?um=1&ie=UTF-8&fb=1&gl=us&sa=X&sll=37.926495,-122.326475&sspn=0.4160564,0.7033851&q=jane+smith&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQtgMwHHoECBUQAQ', '/url?q=https://janesmithagency.com/&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjAfegQIChAB&usg=AOvVaw2UEsvVVzfjPSo2jTypwg5M', '/url?q=https://www.imdb.com/name/nm1056558/&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjAgegQIBxAB&usg=AOvVaw3Dj42U6usb2qYGtaEGXNC3', '/url?q=https://www.linkedin.com/in/jane-smith-98375139&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjAhegQICxAB&usg=AOvVaw272hB7h7A8gxfdHXLLPxQw', '/url?q=https://www.linkedin.com/company/jane-smith-agency&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjAiegQIBhAB&usg=AOvVaw3mu7mMu4Z9tKiFtZYZBkxw', '/url?q=https://www.youtube.com/watch%3Fv%3DpRPjHfcB8oQ&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQtwIwI3oECAIQAQ&usg=AOvVaw1Cz-kyEYPFY07tbiHNrFII', '/url?q=https://www.youtube.com/watch%3Fv%3DpRPjHfcB8oQ&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQuAIwI3oECAIQAg&usg=AOvVaw1YvgQ-UCWkfIZ_TvRJaUNx', '/url?q=https://www.youtube.com/channel/UCQoWOuO_hQvCxl6K8hFctoQ&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjAkegQIBBAB&usg=AOvVaw0aj1ehe4Yku508Z7CtxFt_', '/url?q=https://tardis.fandom.com/wiki/Sarah_Jane_Smith&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjAlegQIAxAB&usg=AOvVaw07Br_gRGRJPIwC4WPaTuKx', '/url?q=https://www.bbcamerica.com/anglophenia/2011/11/a-companion-to-the-doctors-companions-sarah-jane-smith&sa=U&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQFjAmegQIARAB&usg=AOvVaw1VURJRJqjzq8zz940NqeSr', 'https://www.google.com/preferences?hl=en&fg=1&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ5fUCCJ0B'], 'search_queries' => ['/search?q=jane+smith&ie=UTF-8&gbv=1&sei=GysDX7imO4nu-gSnkqS4DQ', '/search?q=jane+smith&ie=UTF-8&source=lnms&tbm=isch&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_AUICCgB', '/search?q=jane+smith&ie=UTF-8&source=lnms&tbm=shop&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_AUICSgC', '/search?q=jane+smith&ie=UTF-8&source=lnms&tbm=nws&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_AUICigD', '/search?q=jane+smith&ie=UTF-8&source=lnms&tbm=vid&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_AUIDCgF', '/search?q=jane+smith&ie=UTF-8&source=lnms&tbm=bks&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_AUIDSgG', '/search?q=jane+smith&ie=UTF-8&source=lnt&tbs=qdr:h&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQpwUIDw', '/search?q=jane+smith&ie=UTF-8&source=lnt&tbs=qdr:d&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQpwUIEA', '/search?q=jane+smith&ie=UTF-8&source=lnt&tbs=qdr:w&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQpwUIEQ', '/search?q=jane+smith&ie=UTF-8&source=lnt&tbs=qdr:m&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQpwUIEg', '/search?q=jane+smith&ie=UTF-8&source=lnt&tbs=qdr:y&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQpwUIEw', '/search?q=jane+smith&ie=UTF-8&source=lnt&tbs=li:1&sa=X&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQpwUIFQ', 'https://www.google.com/search?ie=UTF-8&ei=GysDX7imO4nu-gSnkqS4DQ&q=jane+smith&tbm=isch&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ7Al6BAgUEAw', '/search?ie=UTF-8&q=Elisabeth+Sladen&stick=H4sIAAAAAAAAAOPgE-LUz9U3MC5OMTJVAjNNSgySDLVMspOt9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrApyEitTUxSSKhexCrjmZBYnJqWWZCgE5ySmpOYBAMR5IJhhAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQmxMwCXoECBQQEA', '/search?ie=UTF-8&q=Doctor+Who+The+Time+Warrior&stick=H4sIAAAAAAAAAOPgE-LUz9U3MC5OMTJVAjNNTAtNirVMMsqt9JPzc3JSk0sy8_P00zLBdGJOfHJGYlFicklqUbFVWmZRcYlCYkFBKlAoLzl1Eau0S35ySX6RQnhGvkJIRqpCSGZuqkJ4YlFRZn4RAN36kgxsAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQmxMwCnoECBQQEg', '/search?ie=UTF-8&q=The+Sarah+Jane+Adventures+The+Man+Who+Never+Was+-+Part+1&stick=H4sIAAAAAAAAAB2JsQrCMBRFJ0EdHPyCi6MgsVapdHMVFEGhozzSJ6-QJiGJ8X_8Ulune86508Vypnq1LWO7O6zmI0rli7xfl_KplXbGsE6ds-rV_ZfMUwsF0olDrA3FBPKeh2I1fyfHhzDugwnOZBmnNrNN78AR43Mhi0Ycrpw5oKGIDW4UEoofr2P0NIkAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQmxMwC3oECBQQFA', '/search?ie=UTF-8&q=Whoniverse&stick=H4sIAAAAAAAAAOPgE-LUz9U3MC5OMTJV4gIxjUzjU8wstMwyyq30k_NzclKTSzLz8_TTMsF0Yk58ckZiUWJySWpRsRVcUKE0L7MMKJK6iJUrPCMfygEAeM46cV4AAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQmxMwDHoECBQQFg', '/search?ie=UTF-8&q=The+Lost+Boy+(The+Sarah+Jane+Adventures)&stick=H4sIAAAAAAAAAOPgE-LUz9U3MC5OMTJV4gIxjcrNDYuNtGSzk630k_Lzs8FEfHJGYlFicklqkRWIW7yIVSMkI1XBJ7-4RMEpv1IBzAsGKslQ8ErMS1VwTClLzSspLUot1gQAeEBuKWMAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQmxMwDXoECBQQGA', '/search?ie=UTF-8&q=The+Day+of+the+Clown&stick=H4sIAAAAAAAAAOPgE-LUz9U3MC5OMTJV4gIxTbJysg3NtWSzk630k_Lzs8FEfHJGYlFicklqkRWIW7yIVSQkI1XBJbFSIT9NoQTIdM7JL88DAKxYT6dPAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQmxMwDXoECBQQGQ', '/search?ie=UTF-8&q=The+Last+Sontaran&stick=H4sIAAAAAAAAAOPgE-LUz9U3MC5OMTJV4gIxTbKSU7LKtWSzk630k_Lzs8FEfHJGYlFicklqkRWIW7yIVTAkI1XBJ7G4RCE4P68EKJkHAN69C2NMAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQmxMwDXoECBQQGg', '/search?ie=UTF-8&ei=GysDX7imO4nu-gSnkqS4DQ&q=sarah+jane+smith+books&stick=H4sIAAAAAAAAAOPgE-LUz9U3MC5OMTLVks1OttJPys_PBhPxyRmJRYnJJalFViBuMQATqe0dLAAAAA', '/search?ie=UTF-8&q=The+Sarah+Jane+Adventures&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjPTKnItq7TsspOt9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrErKFIoz8suLFRLzUhRy88syU4sXsUqGZKQqBAOVZCh4JealKjimlKXmlZQWpRYDALXjACp0AAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA56BAgUEB0', '/search?ie=UTF-8&q=K-9+and+Company&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjONDJLSLLTsspOt9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrErKFIoz8suLFRLzUhRy88syU4sXsfJ761qCBZzzcwsS8yoB9JdbVmoAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA56BAgUEB8', '/search?ie=UTF-8&q=Doctor+Who+Television+show&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJV4gAxjSwNzLTsspOt9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrErKFIoz8suLFRLzUhRy88syU4sXsUq55CeX5BcphGfkK4Sk5qSWZRYD9YEVAgBI89pQdAAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA56BAgUECE', '/search?ie=UTF-8&q=sarah+jane+smith+the+five+doctors&stick=H4sIAAAAAAAAAE2MMQoCQQwACxG09QXR0mZFsfAKvyIhmyM53Q1s4orf8aUe2NgNMzCrxWadSjqcPB_Pux9O74vvr3ca0qgUahUft2fVzs35T5FgQwpuQ3RwsZcD1gzFurJ_llufs8CElcGLhkAIwzhvIBuFNf8CQYgmSHwAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA56BAgUECM', '/search?ie=UTF-8&q=The+Hand+of+Fear&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjNNK40zirXsspOt9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrErKFIoz8suLFRLzUhRy88syU4sXsQqEZKQqeIBE8tMU3FITiwBtUWn6awAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA56BAgUECU', '/search?ie=UTF-8&q=Downtime+(Doctor+Who)&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjPNi9Ny47XsspOt9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrErKFIoz8suLFRLzUhRy88syU4sXsYq65JfnlWTmpipouOQnl-QXKYRn5GsCAINZC_dwAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA56BAgUECc', '/search?ie=UTF-8&q=K9+(Doctor+Who)&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjNNsi3NcrSMs5Ot9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrIozU1LLEyuLF7Hye1sqaLjkJ5fkFymEZ-RrAgDnTNluXwAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA96BAgUECo', '/search?ie=UTF-8&q=The+Master+(Doctor+Who)&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjMNTZKr8rSMs5Ot9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrIozU1LLEyuLF7GKh2SkKvgmFgNFFTRc8pNL8osUwjPyNQFM-nxxZwAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA96BAgUECw', '/search?ie=UTF-8&q=The+Doctor+(Doctor+Who)&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVgjBLMrLTtIyzk6300zKTSzLz8xJz4kvzMstSi4pTkYSSMxKLEpNLUousijNTUssTK4sXsYqHZKQquOQnl-QXKWhA6fCMfE0AYfLyrWcAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA96BAgUEC4', '/search?ie=UTF-8&q=Fourth+Doctor&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjPNsjJMi7SMs5Ot9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrIozU1LLEyuLF7HyuuWXFpVkKLjkJ5fkFwEAQ5aHb10AAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA96BAgUEDA', '/search?ie=UTF-8&q=Third+Doctor&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjNNCqrMirWMs5Ot9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrIozU1LLEyuLF7HyhGRkFqUouOQnl-QXAQAkKfEaXAAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA96BAgUEDI', '/search?ie=UTF-8&q=Rose+Tyler&stick=H4sIAAAAAAAAAONgFuLUz9U3MC5OMTJVAjNNyowKc7SMs5Ot9NMyk0sy8_MSc-JL8zLLUouKU5GEkjMSixKTS1KLrIozU1LLEyuLF7FyBeUXpyqEVOakFgEAuYt9_FoAAAA&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ0I4BMA96BAgUEDQ', 'https://www.google.com/search?ie=UTF-8&q=Mary+Jane+DeWolf-Smith+San+Rafael,+CA&ludocid=13922338972308317975&ibp=gwp;0,7&lsig=AB86z5V8FGJkr4mLn6lG67Rof-07&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQvS4wHHoECBUQBA', 'https://www.google.com/search?ie=UTF-8&q=Mary+Jane+DeWolf-Smith+San+Rafael,+CA&ludocid=13922338972308317975&ibp=gwp;0,7&lsig=AB86z5V8FGJkr4mLn6lG67Rof-07&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_pABMBx6BAgVEAU', 'https://www.google.com/search?ie=UTF-8&q=Jane+and+Dave+Smith+Homes+Lafayette,+CA&ludocid=4558241313801314027&ibp=gwp;0,7&lsig=AB86z5VxzfOSkceeP2cXZYLTWiwj&phdesc=5zap7munPRs&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQvS4wHXoECBUQBw', 'https://www.google.com/search?ie=UTF-8&q=Jane+and+Dave+Smith+Homes+Lafayette,+CA&ludocid=4558241313801314027&ibp=gwp;0,7&lsig=AB86z5VxzfOSkceeP2cXZYLTWiwj&phdesc=5zap7munPRs&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_pABMB16BAgVEAg', 'https://www.google.com/search?ie=UTF-8&q=Penelope+Jane+Smith+Orinda,+CA&ludocid=1122275390198880771&ibp=gwp;0,7&lsig=AB86z5Vg93msb9TryadOnKYKLOzg&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQvS4wHnoECBUQCg', 'https://www.google.com/search?ie=UTF-8&q=Penelope+Jane+Smith+Orinda,+CA&ludocid=1122275390198880771&ibp=gwp;0,7&lsig=AB86z5Vg93msb9TryadOnKYKLOzg&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ_pABMB56BAgVEAs', 'https://www.google.com/search?ie=UTF-8&ei=GysDX7imO4nu-gSnkqS4DQ&q=jane+smith&rlst=f&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQjGowHHoECBUQDA', '/search?ie=UTF-8&q=jane+smith+instagram&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ1QJ6BAgAEAE', '/search?ie=UTF-8&q=jane+smith+instagram', '/search?ie=UTF-8&q=jane+smith+facebook&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ1QJ6BAgAEAI', '/search?ie=UTF-8&q=jane+smith+facebook', '/search?ie=UTF-8&q=jane+smith+agency&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ1QJ6BAgAEAM', '/search?ie=UTF-8&q=jane+smith+agency', '/search?ie=UTF-8&q=jane+smith+5-minute+crafts&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ1QJ6BAgAEAQ', '/search?ie=UTF-8&q=jane+smith+5-minute+crafts', '/search?ie=UTF-8&q=jane+smith+actress&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ1QJ6BAgAEAU', '/search?ie=UTF-8&q=jane+smith+actress', '/search?ie=UTF-8&q=jane+smith+obituary&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ1QJ6BAgAEAY', '/search?ie=UTF-8&q=jane+smith+obituary', '/search?ie=UTF-8&q=jane+smith+supermodel&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ1QJ6BAgAEAc', '/search?ie=UTF-8&q=jane+smith+supermodel', '/search?ie=UTF-8&q=jane+smith+linkedin&sa=X&ved=2ahUKEwj4n67E4bjqAhUJt54KHScJCdcQ1QJ6BAgAEAg', '/search?ie=UTF-8&q=jane+smith+linkedin', '/search?q=jane+smith&ie=UTF-8&ei=GysDX7imO4nu-gSnkqS4DQ&start=10&sa=N', '/url?q=https://accounts.google.com/ServiceLogin%3Fcontinue%3Dhttps://www.google.com/search%253Fq%253Djane%252Bsmith%26hl%3Den&sa=U&ved=0ahUKEwj4n67E4bjqAhUJt54KHScJCdcQxs8CCJwB&usg=AOvVaw2BQLH5mSwx4KlCRWmAhcHN'] }
    stubbed_google_all_links
  end
end
