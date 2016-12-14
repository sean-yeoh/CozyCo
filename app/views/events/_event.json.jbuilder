json.array! (events.each) do |event|
  json.extract! event, :id
  json.title event.title
  json.start event.start_date
  json.end event.end_date
  json.url event_url(event)
end