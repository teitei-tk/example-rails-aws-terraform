yarn install
bundle install --path vendor/bundle --without development test
export RAILS_SERVE_STATIC_FILES=true
RAILS_ENV=production bin/rake assets:precompile
RAILS_ENV=production bin/rake db:create db:migrate
RAILS_ENV=production bin/rails server