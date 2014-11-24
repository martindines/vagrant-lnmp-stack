define mysql::db::create ($dbname = $title) {
    exec { "mysql::db::create_${dbname}":
        command => "mysql -uroot -proot -e \"CREATE DATABASE IF NOT EXISTS ${dbname}\"",
        path    => ['/bin', '/usr/bin'],
        require => Exec['set-mysql-password'],
    }
}