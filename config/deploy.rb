require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'    # for rvm support. (http://rvm.io)
require 'mina/unicorn'
require 'mina/slack'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, '54.148.84.141'
set :deploy_to, '/home/rails/apps/smartpaddle_app'
set :repository, 'git@bitbucket.org:pranav7/smartpaddle-ruby.git'
set :user, 'rails'
set :port, '22'
set :forward_agent, true
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"
set :rails_env, 'production'

# For system-wide RVM install.
# set :rvm_path, '/usr/local/rvm/bin/rvm'

def current_git_branch
  `git symbolic-ref --short HEAD`.chomp
end

set :branch, current_git_branch 

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'config/camel_config.yml', 'log']

# Optional settings:
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# Notify Slack Setup
set :slack_token, "T039RJGCW/B03B97Z68/S1Ok90osMwfYZzuSSYKO0RqL" # comes from inbound webhook integration
set :slack_room, "#dev" # the room to send the message to
set :slack_subdomain, "smartpaddle" # if your subdomain is example.slack.com

set :slack_application, "Mina" # override Capistrano `application`
set :slack_username, "Mina" # displayed as name of message sender
set :slack_emoji, ":rocket:" # will be used as the avatar for the message

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  # invoke :'rbenv:load'
  queue %{
echo "-----> Loading environment"
#{echo_cmd %[source ~/.bashrc]}
}

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use[ruby-2.2.0]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/pids"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/sockets"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]

  queue! %[touch "#{deploy_to}/shared/config/secrets.yml"]
  queue %[echo "-----> Be sure to edit 'shared/config/secrets.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
      invoke :'unicorn:restart'
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

