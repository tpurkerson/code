class usecachetest {
# include puppet_agent::params
#  notify{'usecachetest':
#     message=>"agenttest param values - IS_PE: ${puppet_agent::params::_is_pee} VERSION: ${::puppet_agent::params::package_version}"
#  }
notify{'snametest':
 message=>"snametest Here I am"
}

#  file { '/tmp/cachetest/testfile.txt':
#    ensure => directory,
#  }
#   exec { 'ls -al /tmp':
#      cwd => '/tmp/stupidtest',
#   }
}

