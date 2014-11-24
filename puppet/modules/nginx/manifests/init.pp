class nginx {
    file { '/var/www':
        ensure => 'directory',
    }

    file { '/var/www/vagrant-example':
        ensure => 'directory',
    }

    file { '/var/www/vagrant-example/site':
        ensure  => 'link',
        target  => '/vagrant/site',
    }

    package { 'nginx':
        ensure => 'present',
        require => Exec['apt-get update'],
    }

    service { 'nginx':
        ensure => running,
        require => Package['nginx'],
    }

    file { 'vagrant-nginx':
        path => '/etc/nginx/sites-available/vagrant-example.dev',
        ensure => file,
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/vagrant-example.dev',
    }

    file { 'default-nginx-disable':
        path => '/etc/nginx/sites-enabled/default',
        ensure => absent,
        require => Package['nginx'],
    }

    file { 'vagrant-nginx-enable':
        path => '/etc/nginx/sites-enabled/vagrant-example.dev',
        target => '/etc/nginx/sites-available/vagrant-example.dev',
        ensure => link,
        notify => Service['nginx'],
        require => [
            File['vagrant-nginx'],
            File['default-nginx-disable']
        ]
    }
}
