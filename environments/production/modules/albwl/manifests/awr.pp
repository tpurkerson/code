define albwl::awr (
$wl_user = 'pe-puppet' 
){

File { 
  ensure => file, 
  owner => "${wl_user}", 
}

file { [ "/tmp/user_projects", "/tmp/zuser_projects" ]: 
owner => 'root',
}
    file {"/tmp/z24860test" : }


}
#  define albwl::awr { notify{ "testing" : } }
