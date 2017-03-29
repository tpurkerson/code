Facter.add("foo") do
  setcode do
#    "Bar"
    agent_fqdn = Facter.value(:fqdn)
    case agent_fqdn
    when 'pe-201642-agent.puppetdebug.vlan'
      'agent'
    when 'pe-201642-master.puppetdebug.vlan'
      'master'
    else
      distid
    end

  end
end
