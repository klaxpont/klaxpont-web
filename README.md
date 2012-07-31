# Klaxpont
[![Build Status](https://secure.travis-ci.org/klaxpont/klaxpont-web.png)](http://travis-ci.org/klaxpont/klaxpont-web)

# INSTALL

## To install the environment:

* see following docs:

http://railsapps.github.com/installing-rails-3-1.html

http://railsapps.github.com/rails-heroku-tutorial.html

http://devcenter.heroku.com/articles/rails31_heroku_cedar

* install bundle 1.2.0.pre (`ruby` directive in `Gemfile` needs it)

		gem install bundler --pre

* deploy on heroku:

```
 git push heroku master
 heroku logs
```

* create indexes on mongodb

```
 rake db:mongoid:create_indexes
```

# RUN

```
 mongod
```

# API

* List of videos

```
GET /api/videos
RETURNS JSON RESPONSE list of videos or array of errors
```

* List of videos near a given location

```
GET /api/videos/around_location
PARAMS  latitude
  longitude
  distance (km)
RETURNS JSON RESPONSE video or array of errors
```

* Create a user's video

```
POST /api/videos
PARAMS  video_id
  user_id
  latitude
  longitude
  distance (km)
RETURNS JSON RESPONSE video or array of errors
```