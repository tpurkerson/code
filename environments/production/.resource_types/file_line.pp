# This file was automatically generated on 2016-12-16 10:32:19 -0800.
# Use the 'puppet generate types' command to regenerate this file.

# Ensures that a given line is contained within a file.  The implementation
# matches the full line, including whitespace at the beginning and end.  If
# the line is not contained in the given file, Puppet will append the line to
# the end of the file to ensure the desired state.  Multiple resources may
# be declared to manage multiple lines in the same file.
# 
# Example:
# 
#     file_line { 'sudo_rule':
#       path => '/etc/sudoers',
#       line => '%sudo ALL=(ALL) ALL',
#     }
# 
#     file_line { 'sudo_rule_nopw':
#       path => '/etc/sudoers',
#       line => '%sudonopw ALL=(ALL) NOPASSWD: ALL',
#     }
# 
# In this example, Puppet will ensure both of the specified lines are
# contained in the file /etc/sudoers.
# 
# Match Example:
# 
#     file_line { 'bashrc_proxy':
#       ensure => present,
#       path   => '/etc/bashrc',
#       line   => 'export HTTP_PROXY=http://squid.puppetlabs.vm:3128',
#       match  => '^export HTTP_PROXY=',
#     }
# 
# In this code example match will look for a line beginning with export
# followed by HTTP_PROXY and replace it with the value in line.
# 
# Match Example With `ensure => absent`:
# 
#     file_line { 'bashrc_proxy':
#       ensure            => absent,
#       path              => '/etc/bashrc',
#       line              => 'export HTTP_PROXY=http://squid.puppetlabs.vm:3128',
#       match             => '^export HTTP_PROXY=',
#       match_for_absence => true,
#     }
# 
# In this code example match will look for a line beginning with export
# followed by HTTP_PROXY and delete it.  If multiple lines match, an
# error will be raised unless the `multiple => true` parameter is set.
# 
# **Autorequires:** If Puppet is managing the file that will contain the line
# being managed, the file_line resource will autorequire that file.
Puppet::Resource::ResourceType3.new(
  'file_line',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # An arbitrary name used as the identity of the resource.
    Puppet::Resource::Param(Any, 'name', true),

    # An optional ruby regular expression to run against existing lines in the file. If a match is found, we replace that line rather than adding a new line. A regex comparison is performed against the line value and if it does not match an exception will be raised.
    Puppet::Resource::Param(Any, 'match'),

    # An optional value to determine if match should be applied when ensure => absent. If set to true and match is set, the line that matches match will be deleted. If set to false (the default), match is ignored when ensure => absent. When `ensure => present`, match_for_absence is ignored.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'match_for_absence'),

    # An optional value to determine if match can change multiple lines. If set to false, an exception will be raised if more than one line matches
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'multiple'),

    # An optional value used to specify the line after which we will add any new lines. (Existing lines are added in place) This is also takes a regex.
    Puppet::Resource::Param(Any, 'after'),

    # The line to be appended to the file or used to replace matches found by the match attribute.
    Puppet::Resource::Param(Any, 'line'),

    # The file Puppet will ensure contains the line specified by the line parameter.
    Puppet::Resource::Param(Any, 'path'),

    # If true, replace line that matches. If false, do not write line if a match is found
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'replace'),

    # The specific backend to use for this `file_line`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(.*)/ => ['name']
  },
  true)
