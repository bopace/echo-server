ruleset track_trips {
  meta {
    name "Track Trips"
    description <<
Track Trips ruleset for lab 6 - CS 462
>>
    author "Bo Pace"
    logging on
  }

  rule process_trip {
    select when car new_trip mileage re#(.*)# setting(m)
    send_directive("trip", {"length":m})
    fired {
      raise explicit event "trip_processed"
        attributes event:attrs
    }
  }
}
