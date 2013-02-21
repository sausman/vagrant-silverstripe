Vagrant::Config.run do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.network :hostonly, '10.11.12.13'
  config.vm.share_folder 'ss-root', '/silverstripe', ENV['SS_PATH'], extra: 'dmode=775,fmode=775'

  config.vm.provision :chef_solo do |chef|
    mysql_password = ''

    chef.json = {
      mysql: {
        server_root_password: mysql_password,
        server_repl_password: mysql_password,
        server_debian_password: mysql_password
      }
    }

    chef.add_recipe 'apt'
    chef.add_recipe 'openssl'
    chef.add_recipe 'php::package'
    chef.add_recipe 'php::module_gd'
    chef.add_recipe 'php::module_mysql'
    chef.add_recipe 'mysql::server'
    chef.add_recipe 'apache2'
    chef.add_recipe 'apache2::mod_php5'
    chef.add_recipe 'apache2::mod_rewrite'
    chef.add_recipe 'apache2::mod_headers'
  end

  config.vm.provision :shell, path: 'build/configure.sh'
end
