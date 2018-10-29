ruleset track_trips_part_2 {
  meta {
    name "Track Trips"
    description <<
Track Trips ruleset for lab 6 - CS 462
>>
    author "Bo Pace"
    logging on
  }

  global {
    long_trip = 99
  }

  rule process_trip {
    select when car new_trip mileage re#([-+]?[0-9]\d*(\.\d+)?)# setting(m)
    send_directive("trip", {"length":m})
    fired {
      raise explicit event "trip_processed"
        attributes event:attrs
    }
  }

  rule find_long_trips {
    select when explicit trip_processed
    fired {
      raise explicit event "found_long_trip"
        if (event:attr("mileage") > long_trip)
    }
  }
}
