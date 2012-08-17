require "bundler/capistrano"

set :application, "prison_letters"
set :scm, :git
set :repository,  "git@github.com:SCPR/prison_letters.git"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :deploy_to, "/web/archives/prison_letters"

set :user, "archives"
set :use_sudo, false
set :group_writable, false

# --------------
# Variables
set :branch, "master"
set :rails_env, :production


# --------------
# Roles
role :app,      "media.scpr.org"
role :web,      "media.scpr.org"

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end