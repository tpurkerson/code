Facter.add("node_type") do
  setcode do
    agent_fqdn = Facter.value(:fqdn)
    case agent_fqdn
    when 'pe-201642-agent.puppetdebug.vlan'
      'agent'
    when 'pe-201642-master.puppetdebug.vlan'
      'master'
    else
      'unknown'
    end
  end
end
