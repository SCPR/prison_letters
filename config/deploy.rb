require "bundler/capistrano"

set :application, "prison"
set :scm, :git
set :repository,  "git@github.com:SCPR/prison_letters.git"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :deploy_to, "/web/archive/apps/prison"

set :user, "archive"
set :use_sudo, false
set :group_writable, false

# --------------
# Variables
set :branch, "master"
set :rails_env, :production

# --------------
# Roles
media   = "66.226.4.228"
scprdev = "66.226.4.241"
role :app, media
role :web, media

# Setup staging
task :staging do
  roles.clear
  role :app, scprdev
  role :web, scprdev
end

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do end
  task :stop do end
  task :migrate do end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
