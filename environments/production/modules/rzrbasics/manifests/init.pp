
class rzrbasics(
  $ntpServers  = {},
  $postfixHost = "direct",
  $postfixPort = 25
) {

  # NTP class
    class { '::ntp':
    package_ensure  => present,
    service_enable  => true,
    service_ensure  => running,
    servers         => $ntpServers
  }

  # POSTFIX class
#  include postfix
  
   
}


class rzrbasics::paris{

  class { '::rzrbasics':
    ntpServers      => hiera_array('rzrbasics::paris::ntp::servers'),
#    postfixHost     => hiera('rzrbasics::paris::postfix::default::host'),
#    postfixPort     => hiera('rzrbasics::paris::postfix::default::port')
  }
#  class { '::rzrbasics::ldapkrk5paris':}
}


