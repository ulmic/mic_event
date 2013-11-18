require 'capi/unicorn'
require "rvm/capistrano"

set :application, "mic_event"
set :rails_env, "production"
set :rvm_type, :user

role :web, "ulgood.ru"
role :db, "ulgood.ru", primary: true

set :user, "user"

set :use_sudo, false

set :rake, "#{rake} --trace"
set :app_dir, "/srv/#{application}"
set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

set :ssh_options, { forward_agent: true }
default_run_options[:pty] = true

set :repository, "https://github.com/ulmic/mic_event.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

desc "Seed database data"
task :seed_data do
  run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
end

namespace :db do
  desc "Symlink to sqlite db"
  task :symlink do
    run "cd #{current_path}/db && ln -s #{app_dir}/shared/db/development.sqlite3"
  end

  task :migrate do
    run "cd #{current_path}/ && RAILS_ENV=production rake db:migrate"
  end
end

namespace :bundler do
  task :install do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle install"
  end
end

namespace :assets do
  task :precompile do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} rake assets:precompile"
  end
end


after 'deploy:create_symlink', 'db:symlink'
before 'assets:precompile', 'bundler:install'
before 'deploy:create_symlink', 'assets:precompile'
