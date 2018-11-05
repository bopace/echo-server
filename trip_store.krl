ruleset trip_store {
  meta {
    name "Trip Store"
    description <<
Trip Store ruleset for lab 6 - CS 462
>>
    author "Bo Pace"
    logging on
  }

  rule collect_trips {
    select when explicit trip_processed mileage re#([-+]?[0-9]\d*(\.\d+)?)# setting(m)
    fired {
      ent:all_trips := ent:all_trips.defaultsTo([]).append({"mileage": m, "timestamp": time:now()}).klog("all trips so far: ")
    }
  }

  rule collect_long_trips {
    select when explicit found_long_trip mileage re#([-+]?[0-9]\d*(\.\d+)?)# setting(m)
    fired {
      ent:long_trips := ent:long_trips.defaultsTo([]).append({"mileage": m, "timestamp": time:now()}).klog("all long trips so far: ")
    }
  }
}
