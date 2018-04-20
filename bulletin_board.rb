require 'watir'
caps = Selenium::WebDriver::Remote::Capabilities.new

caps["name"] = "Bulletin Board Test Example"
caps["browserName"] = "chrome"
caps["screenResolution"] = "1024x768"
caps["recordVideo"] = "true"

browser = Watir::Browser.new(
    :remote,
    :url => "http://hub:4444/wd/hub",
    :desired_capabilities => caps)
  
browser.goto 'http://bulletin:8080'
title = browser.text_field css: 'input[class="form-control"][placeholder="Title"]'
title.set 'Party'
btn = browser.button value: 'Submit'
btn.click

puts browser.title
# => Bulletin Board
browser.quit