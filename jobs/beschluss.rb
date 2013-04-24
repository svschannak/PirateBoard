SCHEDULER.every '3h', :first_in => 0 do |job|
  send_event('beschlussfaehig', text: "Nein")
end