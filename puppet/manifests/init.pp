exec { 'apt-get update':
    path => '/usr/bin',
}

package { ['vim', 'git', 'curl']:
    ensure => present,
}

include nginx, php, mysql, magerun
