set :rails_env, 'production'
set :branch, 'master'

set :keep_releases, 15

set :user, 'mic_event'

server "ulgood.ru", :app, :web, :db, :primary => true
