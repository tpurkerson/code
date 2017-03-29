class zcomponent {
  notify { "in component" :}

#  file {'/tmp/tidytest':
#    ensure => 'directory',
#    recurse => true,
##    source => '/tmp/files',
#  }

  class { 'zcomponent::tcaware::cleanup_temp_dirs':
    all_temp_dirs => '/tmp/tidytest',
    tidy_tempfiles_max_age => '2d',
  }

}
