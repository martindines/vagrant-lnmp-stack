exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'vim':
  ensure => present,
}

package { 'git':
  ensure => present,
}

include nginx, php, mysql
