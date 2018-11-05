ruleset trip_store {
  meta {
    name "Trip Store"
    description <<
Trip Store ruleset for lab 6 - CS 462
>>
    author "Bo Pace"
    logging on
  }

  global {
    long_trip = 99
  }

  rule collect_trips {
    select when explicit processed_trip mileage re#([-+]?[0-9]\d*(\.\d+)?)# setting(m)
    fired {
      ent:all_trips := ent:all_trips.defaultsTo([]).put([m, time:now()])
    }
  }
}
