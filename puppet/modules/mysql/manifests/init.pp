class mysql {
    package { ['mysql-server']:
        ensure => present,
        require => Exec['apt-get update'],
    }

    service { 'mysql':
        ensure  => running,
        require => Package['mysql-server'],
    }

    file { '/etc/mysql/my.cnf':
        source  => 'puppet:///modules/mysql/my.cnf',
        require => Package['mysql-server'],
        notify  => Service['mysql'],
    }

    exec { 'set-mysql-password':
        unless  => 'mysqladmin -uroot -proot password root',
        command => 'mysqladmin -uroot password root',
        path    => ['/bin', '/usr/bin'],
        require => Service['mysql'],
    }

    exec { 'set-mysql-remote-access':
        command => "mysql -u root -proot -e \"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;\"",
        path    => ['/bin', '/usr/bin'],
        require => Exec['set-mysql-password'],
    }

    mysql::db::create { 'exampledatabase': }
}

