require "bundler/capistrano"
require "delayed/recipes"

load 'deploy/assets'

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
set :rails_env, "production"
set :use_sudo, false

set :scm, "git"
set :repository, 'git://github.com/terracatta/lattis.git'
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  desc "Initially load the database with seed data"
  task :seed do
   run "cd #{release_path} && rake RAILS_ENV=#{rails_env} db:seed"
  end
end

after "deploy:update_code", "deploy:migrate"
after "deploy:migrate", "deploy:seed" # seed file always be safe to re-run
after "deploy", "deploy:cleanup" # keep only the last 5 releases
