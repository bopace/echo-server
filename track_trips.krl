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
    select when echo message mileage re#(.*)# setting(m)
    send_directive("trip", {"length":m})
  }
}
