require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/ruby"
load "config/recipes/apache"
load "config/recipes/postgresql"
load "config/recipes/nodejs"

set(:deploy_server,
  Capistrano::CLI.ui.ask("FQDN (Not IP) of server you are actioning: "))

server "#{deploy_server}", :web, :app, :db, primary: true

set :user, "deploy"
set :application, "lattis"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, 'git://github.com/terracatta/lattis.git'
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
