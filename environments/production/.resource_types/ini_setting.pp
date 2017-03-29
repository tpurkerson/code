# This file was automatically generated on 2016-12-16 10:32:19 -0800.
# Use the 'puppet generate types' command to regenerate this file.

Puppet::Resource::ResourceType3.new(
  'ini_setting',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The value of the setting to be defined.
    Puppet::Resource::Param(Any, 'value')
  ],
  [
    # An arbitrary name used as the identity of the resource.
    Puppet::Resource::Param(Any, 'name', true),

    # The name of the section in the ini file in which the setting should be defined.If not provided, defaults to global, top of file, sections.
    Puppet::Resource::Param(Any, 'section'),

    # The name of the setting to be defined.
    Puppet::Resource::Param(Any, 'setting'),

    # The ini file Puppet will ensure contains the specified setting.
    Puppet::Resource::Param(Any, 'path'),

    # Whether to display differences when the setting changes.
    # 
    # Valid values are `true`, `md5`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'md5', 'false']], 'show_diff'),

    # The separator string to use between each setting name and value. Defaults to " = ", but you could use this to override e.g. ": ", orwhether or not the separator should include whitespace.
    Puppet::Resource::Param(Any, 'key_val_separator'),

    # The prefix to the section name's header.Defaults to '['.
    Puppet::Resource::Param(Any, 'section_prefix'),

    # The suffix to the section name's header.Defaults to ']'.
    Puppet::Resource::Param(Any, 'section_suffix'),

    # A flag indicating whether or not the ini_setting should be updated only when called as part of a refresh event
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'refreshonly'),

    # The specific backend to use for this `ini_setting`
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
