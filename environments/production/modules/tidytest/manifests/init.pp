class tidytest {
  notify {"In tidytest":}

  tidy { '/tmp': 
    recurse => 1, 
    matches => [ '18*.conf' ], 
  }
}
