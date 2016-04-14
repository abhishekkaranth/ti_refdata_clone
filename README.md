# Travel Intelligence Reference Data

## Installation

    cd spec/test_app_3
    bundle install
    bundle exec rake ti_refdata:install:migrations
    bundle exec rake db:migrate
    RAILS_ENV=test bundle exec rake db:setup
    cd ../..
    BUNDLE_GEMFILE=spec/test_app_3/Gemfile bundle exec rspec
