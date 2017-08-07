require 'watir' # Crawler
require 'pry'
username = "panoragr.am"
password = "panoragram$17"

# login to Instagram
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login/"

puts "Logging in..."
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

browser.button(:class => '_ah57t _84y62 _i46jh _rmr7s').click
sleep(2)
puts "We're in #DatCrawlLifeDoe"
# go to profile
browser.link(:class => "_soakw _vbtk2 coreSpriteDesktopNavProfile").click
# open followings
browser.link(:class => "_s53mj").click
# clic on first unfollow
browser.divs(:class => "_ah57t _6y2ah _i46jh _rmr7s").click
sleep(5)
