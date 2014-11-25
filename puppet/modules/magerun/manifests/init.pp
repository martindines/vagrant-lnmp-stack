class magerun {
    exec { 'download-magerun':
        command => 'curl -L -o magerun https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar',
        cwd     => '/usr/local/bin',
        creates => '/usr/local/bin/magerun',
        require => Package['curl', 'php5-cli'],
        path    => ['/bin', '/usr/bin'],
    }

    file { 'magerun':
        path    => '/usr/local/bin/magerun',
        mode    => '0755',
        owner   => root,
        group   => root,
        require => Exec['download-magerun'],
    }
}