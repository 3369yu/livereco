json.array!(@events) do |event|
  json.id event.id
  json.name event.name
  json.start event.start.in_time_zone('Tokyo')
  json.end event.end.in_time_zone('Tokyo')
end