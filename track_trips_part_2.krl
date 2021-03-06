ruleset track_trips_part_2 {
  meta {
    name "Track Trips"
    description <<
Track Trips ruleset for lab 6 - CS 462
>>
    author "Bo Pace"
    logging on
    use module trip_store
    shares test_trips_function
  }

  global {
    long_trip = 99

    test_trips_function = function() {
      trip_store:trips()
    }
  }

  rule process_trip {
    select when car new_trip mileage re#([-+]?[0-9]\d*(\.\d+)?)# setting(m)
    send_directive("trip", {"length":m})
    fired {
      timestamp = {"timestamp": time:now()};
      raise explicit event "trip_processed"
        attributes event:attrs.put(timestamp)
    }
  }

  rule find_long_trips {
    select when explicit trip_processed
    fired {
      raise explicit event "found_long_trip"
        attributes event:attrs
          if (event:attr("mileage") > long_trip)
    }
  }
}
