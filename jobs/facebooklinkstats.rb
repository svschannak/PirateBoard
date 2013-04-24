#!/usr/bin/env ruby
require 'net/http'
require 'json'
 
# The url you are tracking
sharedlink = URI::encode('piratenrostock')
 
SCHEDULER.every '1m', :first_in => 0 do |job|
  fbstat = []
 
  http = Net::HTTP.new('graph.facebook.com')
  response = http.request(Net::HTTP::Get.new("/fql?q=SELECT%20fan_count%20FROM%20page%20WHERE%20username=%22#{sharedlink}%22"))
  fbcounts = JSON.parse(response.body)['data']
 
  fbcounts[0].each do |stat|
    fbstat << {:label=>stat[0], :value=>stat[1]}
  end
 
   send_event('fblinkstat', { items: fbstat })
 
end