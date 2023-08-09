set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:rollback STEP=1
bundle exec rake db:reset
bundle exec rake db:migrate
bundle exec rake db:seed
