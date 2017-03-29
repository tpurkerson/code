## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
notify { "Node ${fqdn} has no node definition": }
}
node pe-201642-master {
# class { 'pwcseccore':}
# class { 'factcheck':}
#include filetest
# notify { "Node ${fqdn} has no node definition": }
# include dontbesosensitive
# include tidytest
# include zcomponent
}
node pe-201642-agent-win2012 {
include regtest
}
node pe-201642-agent-three {
 $e = $trusted['extensions']['pp_image_name']
      notify { "pp_image_name = $e": }
 $f = $clientcert
    notify { "cli cert = $f": }
class { 'pwcseccore':}
include filetest
}
node pe-201642-agent {
 #include wl
 write_line_to_file('/tmp/some_file', "Hello world")
}
