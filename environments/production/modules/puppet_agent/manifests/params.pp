# == Class puppet_agent::params
#
# This class is meant to be called from puppet_agent
# It sets variables according to platform.
#
class puppet_agent::params {

  if $::puppet_stringify_facts {
    fail('The puppet_agent class requires stringify_facts to be disabled')
  }

  # The `is_pe` fact currently works by echoing out the puppet version
  # and greping for "puppet enterprise". With Puppet 4 and PE 2015.2, there
  # is no longer a "PE Puppet", and so that fact will no longer work.
  # Instead check both the `is_pe` fact as well as if a PE provided
  # function is available
  $_is_pe = ($::is_pe or is_function_available('pe_compiling_server_version'))

  # In Puppet Enterprise, agent packages are provided by the master
  # with a default prefix of `/packages`.
  if $::osfamily != 'windows' {
    $_source = $_is_pe ? {
      true    => "https://${::servername}:8140/packages",
      default => undef,
    }
  }

  $package_name = 'puppet-agent'
  $install_dir = undef

  case $::osfamily {
    'RedHat', 'Debian', 'Suse', 'Solaris', 'Darwin', 'AIX': {
      if !($::osfamily == 'Solaris' and $::operatingsystemmajrelease == '11') {
        $service_names = ['puppet', 'mcollective']
      }

      $local_puppet_dir = '/opt/puppetlabs'
      $local_packages_dir = "${local_puppet_dir}/packages"

      $confdir = '/etc/puppetlabs/puppet'
      $mco_dir = '/etc/puppetlabs/mcollective'

      $mco_install = "${local_puppet_dir}/mcollective"
      $logdir = '/var/log/puppetlabs'

      # A list of dirs that need to be created. Mainly done this way because
      # Windows requires more directories to exist for confdir.
      $puppetdirs = ['/etc/puppetlabs', $confdir]
      $mcodirs = [$mco_dir]

      $path_separator = ':'

      $user  = 0
      $group = 0
    }
    'windows' : {
      $service_names = ['puppet', 'mcollective']

      $local_puppet_dir = windows_native_path("${::common_appdata}/Puppetlabs")
      $local_packages_dir = windows_native_path("${local_puppet_dir}/packages")

      $confdir = $::puppet_confdir
      $mco_dir = $::mco_confdir

      $mcodirs = [$mco_dir] # Directories should already exists as they have not changed
      $puppetdirs = [regsubst($confdir,'\/etc\/','/code/')]
      $path_separator = ';'

      $user  = 'S-1-5-32-544'
      $group = 'S-1-5-32-544'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  # Treat Amazon Linux just like Enterprise Linux 6
  if $_is_pe {
    $_platform_tag = $::platform_tag
  } else {
    $_platform_tag = undef
  }
  $pe_repo_dir = ($::operatingsystem == 'Amazon') ? {
    true    => "el-6-${::architecture}",
    default =>  $_platform_tag,
  }

  # The aio puppet-agent version currently installed on the compiling master
  # (only used in PE)
  if ($_is_pe and is_function_available('pe_compiling_server_aio_build')) {
    $master_agent_version = pe_compiling_server_aio_build()
  } else {
    $master_agent_version = undef
  }

  if ($master_agent_version != undef and versioncmp("${::clientversion}", '4.0.0') < 0) {
    $package_version = $master_agent_version
  } else {
    $package_version = undef
  }

  $ssldir = "${confdir}/ssl"
  $config = "${confdir}/puppet.conf"

  $mco_server  = "${mco_dir}/server.cfg"
  $mco_client  = "${mco_dir}/client.cfg"
  $mco_libdir  = "${mco_install}/plugins"
  $mco_plugins = "${mco_dir}/facts.yaml"
  $mco_log     = "${logdir}/mcollective.log"
}
