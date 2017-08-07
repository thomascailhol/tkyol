require 'watir' # Crawler
require 'pry'
username = "panoragr.am"
password = "panoragram$17"
keyword = "panorama"
like_counter = 0
num_of_rounds = 0
MAX_LIKES = 200

# TODO 
# ADD RAND TO SLEEP

# Open Browser, Navigate to Login page
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login/"

# Navigate to Username and Password fields, inject info
puts "Logging in..."
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

# Click Login Button
browser.button(:class => '_ah57t _84y62 _i46jh _rmr7s').click
sleep(2)
puts "We're in #DatCrawlLifeDoe"

# search 
browser.text_field(class: '_9x5sw _qy55y').set "#{keyword}"
sleep(1)
# launch search
browser.send_keys :return
browser.send_keys :down
browser.send_keys :return
sleep(1)
# Click on first post
# wtf = browser.div(:class => '_22yr2').click

wtf = browser.divs(:class => "_22yr2")[0].click

# def with_delay(n)
#     puts "#{Time.new} Will sleep for #{n} seconds"
#     sleep(n)

#     puts "#{Time.new} Yielding now..."
#     yield
# end

sleep(1)
loop do
  # browser.span(:class => "_soakw coreSpriteHeartOpen").click
  # browser.link(:class => "_de018 coreSpriteRightPaginationArrow").click
  if browser.span(:class => "_soakw coreSpriteHeartOpen").exists?
    # like
    browser.span(:class => "_soakw coreSpriteHeartOpen").click
    like_counter += 1
    puts "Photos liked: #{like_counter}! Next!"
    browser.link(:class => "_de018 coreSpriteRightPaginationArrow").click
    # sleep(rand(3..5))
    sleep(1)
  else
    puts "Liked already, going to the next one"
    browser.link(:class => "_de018 coreSpriteRightPaginationArrow").click
  end
    break if like_counter >= MAX_LIKES
end
binding.pry
# sleep(5)
# # Continuous loop to break upon reaching the max likes
# loop do
#   # Scroll to bottom of window 3 times to load more results (20 per page)
#   3.times do |i|
#     browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
#     sleep(1)
#   end

#   # Call all unliked like buttons on page and click each one.
#   if browser.span(:class => "_soakw coreSpriteHeartOpen").exists?
#     browser.spans(:class => "_soakw coreSpriteHeartOpen").each { |val|
#       val.click
#       like_counter += 1
#     }
#     ap "Photos liked: #{like_counter}"
#   else
#     ap "No media to like rn, yo. Sorry homie, we tried."
#   end
#   num_of_rounds += 1
#   puts "--------- #{like_counter / num_of_rounds} likes per round (on average) ----------"
#   break if like_counter >= MAX_LIKES
#   sleep(30) # Return to top of loop after this many seconds to check for new photos
# end