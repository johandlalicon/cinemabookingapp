set -o errexit

bundle install
bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rake assets:precompile
bundle exec rake assets:clean

# bundle install
# bundle exec rake assets:precompile
# bundle exec rake assets:clean
# bundle exec rake db:migrate VERSION=0
# bundle exec rake db:migrate
# bundle exec rake db:seed
