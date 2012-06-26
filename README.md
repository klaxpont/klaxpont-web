= INSTALL

== To install the environment:
http://railsapps.github.com/installing-rails-3-1.html
http://railsapps.github.com/rails-heroku-tutorial.html
http://devcenter.heroku.com/articles/rails31_heroku_cedar

## deploy on heroku:
    
    git push heroku master
    heroku logs

## create indexes on mongodb

    rake db:mongoid:create_indexes
    
= RUN

	mongod
