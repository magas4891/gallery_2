# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.11.1'

set :application, :gallery
set :repo_url, 'git@github.com:magas4891/gallery_2.git'
set :deploy_to, '/home/deploy_user/www/public/gallery'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache',
                                               'tmp/sockets', 'vendor/bundle',
                                               'public/system',
                                               'public/uploads')
set :rvm_ruby_version, '2.5.5'
# set :rvm1_map_bins,   -> { %w{rake gem bundle ruby} }
set :rvm_custom_path, '/usr/share/rvm'
# set :rvm1_map_bins,   -> { %w{rake gem bundle ruby} }
# set :rvm1_map_bins, %w{rake gem bundle ruby}
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/gallery"
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log",
#                                           color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
#           'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids',
#           'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system',
#                                         'public/uploads')
set :linked_files, %w[config/database.yml]
set :linked_files, %w[config/master.key]
# append :linked_files, *%w(
#   config/database.yml
#   config/master.key
# )

# append :linked_dirs, *%w(
#   log
#   public/system
#   public/uploads
#   tmp/cache
#   tmp/pids
#   tmp/sockets
#   tmp/letter_opener
#   .bundle
# )
# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets",
#                                                     "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :env_file, '.env'

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before
#                                                         first deploy.
# set :ssh_options, verify_host_key: :secure
# set :migration_role, :app
# set :passenger_environment_variables,
#                       { :path => '/path-to-passenger/bin:$PATH' }
# set :passenger_restart_command, '/path-to-passenger/bin/passenger-config
#                                                         restart-app'
set :passenger_restart_with_touch, true

# namespace :deploy do
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
# end
