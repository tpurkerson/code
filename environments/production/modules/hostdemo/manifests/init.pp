class hostdemo {

  host {'myserver' :
    ensure => 'present',
    ip => '11.10.10.32',
    target => '/etc/hosts',
  }
}
