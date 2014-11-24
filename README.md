# Vagrant LNMP Stack

LNMP stack to be used as a starting point for future development. Dependencies managed with Puppet.

### Information

- ubuntu/trusty64
 - Private IP 10.10.10.10
 - Forwards port 5000 to 80.
 - NFS share `../` > `/vagrant`
- NGINX
 - Creates directory `/var/www/vagrant-example`
 - Symlinks `/var/www/vagrant-exmaple/site` > `/vagrant/site`
 - Creates site config file for server name `vagrant-example.dev` with root of `/var/www/vagrant-example/site/public_html`
- PHP
 - Using php5-fpm, with the following modules: php5-cli, php5-mysql
- MySQL
 - username `root` password `root`
 - Example database `exampledatabase`
