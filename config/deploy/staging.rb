set :branch, 'staging'
set :rails_env, :staging
set :deploy_to, '/web/justask-staging'

server '162.243.206.8', user: 'deploy', roles: %w{web app db}
