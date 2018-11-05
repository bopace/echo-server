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
      ent:all_trips := ent:all_trips.defaultsTo([]).put([m, time:now()]).klog("all trips so far: ")
    }
  }
}
