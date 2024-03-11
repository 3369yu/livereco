json.array!(@events) do |event|
  json.id event.id
  json.user_id event.user_id
  json.name event.name
  json.data event.event_data.in_time_zone('Tokyo')
  json.place event.place
  json.open event.open
  json.start event.start.in_time_zone('Tokyo')
  json.end event.end
  json.title event.title
  json.price event.price
  json.buy event.buy
  json.seet event.seet
  json.transportation event.transportation
  json.stay event.stay
  json.impression event.impression
  json.setlist event.setlist
  json.status event.status
end