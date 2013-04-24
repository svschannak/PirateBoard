#!/usr/bin/env ruby
require 'net/https'
require 'json'
 
# The url you are tracking
 
SCHEDULER.every '10s', :first_in => 0 do |job|
  initiative_list = []
 
  http = Net::HTTP.new('api-smvmv.lqpp.de', 443)
  
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.request(Net::HTTP::Get.new("/initiative"))
  initiatives = JSON.parse(response.body)['result']

  new_id = initiatives[-1]['id']
  initiative = http.request(Net::HTTP::Get.new("/initiative?initiative_id=#{new_id}"))
  initiative = JSON.parse(initiative.body)['result']
  initiative_list << {:label=>initiative[0]["id"], :value=>initiative[0]["name"].slice(0,40)}
  new_id = initiatives[-2]['id']
  initiative = http.request(Net::HTTP::Get.new("/initiative?initiative_id=#{new_id}"))
  initiative = JSON.parse(initiative.body)['result']
  initiative_list << {:label=>initiative[0]["id"], :value=>initiative[0]["name"].slice(0,40)}
  new_id = initiatives[-3]['id']
  initiative = http.request(Net::HTTP::Get.new("/initiative?initiative_id=#{new_id}"))
  initiative = JSON.parse(initiative.body)['result']
  initiative_list << {:label=>initiative[0]["id"], :value=>initiative[0]["name"].slice(0,40)}
  new_id = initiatives[-4]['id']
  initiative = http.request(Net::HTTP::Get.new("/initiative?initiative_id=#{new_id}"))
  initiative = JSON.parse(initiative.body)['result']
  initiative_list << {:label=>initiative[0]["id"], :value=>initiative[0]["name"].slice(0,40)}
  new_id = initiatives[-5]['id']
  initiative = http.request(Net::HTTP::Get.new("/initiative?initiative_id=#{new_id}"))
  initiative = JSON.parse(initiative.body)['result']
  initiative_list << {:label=>initiative[0]["id"], :value=>initiative[0]["name"].slice(0,40)}
  
    #fbcounts.each do |stat|
    #  fbstat << {:label=>stat["id"], :value=>"Thema"}
    #end
 
   send_event('smv', { items: initiative_list })
 
end