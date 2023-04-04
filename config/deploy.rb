# config valid only for current version of Capistrano
lock '~>3.0'

set :application, 'repecwp'
set :repo_url, 'https://github.com/pulibrary/repecwp.git'

set :bundle_without, 'doc'

set :branch, ENV["BRANCH"] || "main"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/opt/repec'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Force passenger to use touch tmp/restart.txt instead of
# passenger-config restart-app which requires sudo access
set :passenger_restart_with_touch, true

# stop sprokets from crashing the production deploy
Rake::Task["deploy:assets:backup_manifest"].clear_actions
Rake::Task["deploy:assets:restore_manifest"].clear_actions 

namespace :deploy do

  #   on roles(:web) do
  #   end
  # end
  desc "Place assets at the top level so that they can be access by the server as well as the proxied server" 
  task :local_assets do
    on roles(:web) do
      within release_path do
        execute "pwd"
        execute :rake, "assets:precompile ASSET_PREFIX=/assets"
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after "deploy:assets:precompile", "deploy:local_assets"

end
