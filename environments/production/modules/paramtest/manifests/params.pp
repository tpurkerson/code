class paramtest::params inherits ::paramtest::enabling {
  if $enable_thing {
    $xvar = 'present'
    $yvar = 'present'
    $zvar = 'not present'
  }
  else {
    $xvar = 'not present'
    $yvar = 'not present'
    $zvar = 'present'
  }
notify {"params enable_thing is ${enable_thing}":}
}

