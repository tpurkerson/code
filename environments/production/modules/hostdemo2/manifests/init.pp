class hostdemo2 {
  exec { "apply_host_entry":
    command => "/bin/echo '0.0.1.1 test' >> /etc/hosts",
    unless => "/bin/grep -w 'test' /etc/hosts",
  }
 }

