set :rails_env, 'production'

set :user, "vagrant"
server "192.168.2.10", :app, :web, :db, :primary => true
set :deploy_to, "/srv/i_am_the_lider"