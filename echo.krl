ruleset echo {
  meta {
    name "Echo"
    description <<
Echo ruleset for lab 6 - CS 462
>>
    author "Bo Pace"
    logging on
  }

  rule hello {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }

  rule message {
    select when echo message input re#(.*)# setting(m)
    send_directive("say", {"something":m})
  }
}
