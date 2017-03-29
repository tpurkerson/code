class filetest (
$message
) {
$myhostname = "${::hostname}"
$binaries = ["cfacter", "facter", "hiera", "mco", "puppet", "puppetserver"]
$binaries.each |String $binary| { notify{ "HERE ${binary}" :} }

notify {'myhiera':
# message => hiera('message')
message => "$message"
}

File {
source => 'puppet:///modules/filetest/myfile.txt',
}
file { 'fileone':
path => "/tmp/$myhostname",
# source => 'puppet:///modules/filetest/myfile.txt',
}

file { 'filetwo':
path => '/tmp/myfiletest',
# source => 'puppet:///modules/filetest/myfile.txt',
}
}
