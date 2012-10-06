namespace :deploy do
  desc "Restart the Rails application by forcing passenger to restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
