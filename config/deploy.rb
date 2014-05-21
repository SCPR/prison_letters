require "bundler/capistrano"

deploy_config = YAML.load_file("config/deploy_config.yml")

set :application, "prison"
set :scm, :git
set :repository,  "git@github.com:SCPR/prison_letters.git"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :deploy_to, deploy_config['deploy_to']

set :user, deploy_config['user']
set :use_sudo, false
set :group_writable, false

# --------------
# Variables
set :branch, "master"
set :rails_env, :production

role :app, deploy_config['web']

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do end
  task :stop do end
  task :migrate do end
  task :restart do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
