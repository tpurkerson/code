class pwcseccore ( 
) {

notify {'Running pwcseccore':}

notify { "The good fact is: ${::facts['uptime']}":}
# notify { "The bad fact is: $::facts['uptime']":}
if $::facts['uptime'] == '109 days' {
notify{"QQQQQQQ":}
}
#case $::osfamily {
case $facts['osfamily']{
  'zzz' : {notify {'It is zzz':}}
  'redhat': { include usecachetest }
#  'redhat': {notify {'It is redhat':}}
  'Redhat' : {notify {'It is Redhat':}}
  'RedHat' : {notify {'It is RedHat':}}
}
#case $::osfamily {
#'RedHat': { include pwcseccore::rhel } 
#} 
}
