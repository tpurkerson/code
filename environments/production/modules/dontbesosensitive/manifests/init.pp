class dontbesosensitive {
# $secret = 'myPassword'
$secret = Sensitive('myPassword')
notice($secret)
$processed = $secret.unwrap
notice $processed

# exec {'/bin/echo XXsecret':
exec { "/bin/echo ${secret.unwrap} >> /tmp/myecho.txt":
  path   => '/usr/bin:/usr/sbin:/bin',
}
}
