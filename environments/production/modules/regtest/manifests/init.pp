class regtest{

registry_value { 'HKLM\System\CurrentControlSet\Services\Puppet\Description':
  ensure => present,
  type   => string,
  data   => "The Puppet Agent service periodically manages your configuration",
}
# registry_value { 'hklm\SYSTEM\CurrentControlSet\Services\TermService\Parameters\LicenseServers': 
registry_value { 'hklm\SYSTEM\CurrentControlSet\Services\TermService\Parameters\LicenseServers\SpecifiedLicenseServers': 
  ensure => present,
  type   => string,
  data   => "The Puppet Agent service periodically manages your configuration",
}
}
