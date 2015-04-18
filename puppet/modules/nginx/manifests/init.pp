class nginx {
    file { '/var/www':
        ensure => 'directory',
    }

    file { '/var/www/openid':
        ensure => 'directory',
    }

    file { '/var/www/openid/site':
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
        path => '/etc/nginx/sites-available/openid.dev',
        ensure => file,
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/openid.dev',
    }

    file { 'default-nginx-disable':
        path => '/etc/nginx/sites-enabled/default',
        ensure => absent,
        require => Package['nginx'],
    }

    file { 'vagrant-nginx-enable':
        path => '/etc/nginx/sites-enabled/openid.dev',
        target => '/etc/nginx/sites-available/openid.dev',
        ensure => link,
        notify => Service['nginx'],
        require => [
            File['vagrant-nginx'],
            File['default-nginx-disable']
        ]
    }
}
