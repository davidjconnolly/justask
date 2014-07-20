set :branch, 'master'
set :rails_env, :production
set :deploy_to, '/web/justask'

server '162.243.206.8', user: 'deploy', roles: %w{web app db}