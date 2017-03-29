class factcheck () {

  notify {'Running factcheck':}

  notify { "The good fact is: ${::facts['architecture']}":}
#  notify { "The bad fact is: $::facts['architecture']":}

  if $::facts['architecture'] == 'nonsense' {
    notify{"nonsense - architecture is x86_64":}
  }
  if $::facts['architecture'] == 'x86_64' {
    notify{"First - architecture is x86_64":}
  }
  if "${::facts['architecture']}" == 'x86_64' {
    notify{"Second - architecture is x86_64":}
  }

}

