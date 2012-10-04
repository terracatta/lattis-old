namespace :apache2 do
  desc "Install latest stable release of apache2 and passenger"
  task :install, roles: :web do
    install_package "apache2 apache2-prefork-dev libapr1-dev libaprutil1-dev"
    run "#{sudo} gem install passenger"
    run "#{sudo} passenger-install-apache2-module  -a"
  end
  after "deploy:install", "apache2:install"

  desc "Setup apache2 configuration/mods for this application and generate SSL cert"
  task :setup, roles: :web do

    run "openssl genrsa -out /tmp/server.key 1024"
    run "openssl req -new -x509 -subj " +
    "\"/C=US/ST=State/L=City/O=Lattis/" +
    "CN=#{deploy_server}\" -days 3650 " +
    "-key /tmp/server.key -out /tmp/server.crt -extensions v3_ca"

    template "virtual_host.conf.erb", "/tmp/lattis"

    run "#{sudo} mv /tmp/lattis /etc/apache2/sites-enabled/#{application}"
    run "#{sudo} rm -f /etc/apache2/sites-enabled/default"
    run "#{sudo} a2enmod headers"
    run "#{sudo} a2enmod ssl"

    run "#{sudo} mkdir -p /etc/pki/tls/certs/"
    run "#{sudo} mkdir -p /etc/pki/tls/private/"
    run "#{sudo} mv /tmp/server.key /etc/pki/tls/private/server.key"
    run "#{sudo} mv /tmp/server.crt /etc/pki/tls/certs/server.crt"

    restart
  end
  after "deploy:setup", "apache2:setup"

  %w[start stop restart].each do |command|
    desc "#{command} apache2"
    task command, roles: :web do
      run "#{sudo} service apache2 #{command}"
    end
  end
end
