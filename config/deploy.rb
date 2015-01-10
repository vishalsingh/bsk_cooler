# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'bsk_coolers'
set :repo_url, 'git@github.com:vishalsingh/bsk_cooler.git'
set :rbenv_type, :user
set :rbenv_ruby, '2.1.2'
#set :port, 4444
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :branch, ENV['BRANCH'] || :master

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deploy/'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#set :linked_files, %w(.env)
# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}


# Default value for linked_dirs is []
#set :linked_dirs, %w(bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#namespace :uploads do

#desc «-EOD Creates the upload folders unless they exist and sets the proper upload permissions. EOD task :setup, :except => { :no_release => true } do dirs = uploads_dirs.map { |d| File.join(shared_path, d) } run "#{try_sudo} mkdir -p #{dirs.join(' ')} && #{try_sudo} chmod g+w #{dirs.join(' ')}" end

#desc «-EOD [internal] Creates the symlink to uploads shared folder for the most recently deployed version. EOD task :symlink, :except => { :no_release => true } do run "rm -rf #{release_path}/public/uploads" run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads" end

#desc «-EOD [internal] Computes uploads directory paths and registers them in Capistrano environment. EOD task :register_dirs do set :uploads_dirs, %w(uploads uploads/partners) set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs) end

#after "deploy:finalize_update", "uploads:symlink" on :start, "uploads:register_dirs"

#end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
      #invoke 'init:restart'
    end
  end

  after :publishing, :restart
  after :updated, :migrate

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
