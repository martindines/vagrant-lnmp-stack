class php {
    package { ['php5-fpm', 'php5-cli', 'php5-mysql', 'php5-curl', 'php5-mcrypt', 'php5-gd']:
        ensure => present,
        require => Exec['apt-get update'],
    }

    service { 'php5-fpm':
        ensure => running,
        require => Package['php5-fpm']
    }

    exec { 'enabling-mcrypt':
        command => 'php5enmod mcrypt && service nginx reload',
        require => Package['php5-mcrypt', 'nginx'],
        path    => ['/bin', '/usr/bin', '/usr/sbin'],
    }
}
