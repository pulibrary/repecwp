# README

This application provides data about economics working papers that Princeton publishes to the [Research Papers in Economics (RePEc) project.](http://repec.org/).  It uses a format called [Research Documents Information Format (ReDIF)](https://openlib.org/acmes/root/docu/redif_1.html).

## Set Up Development Environment

###
```
> git clone git@github.com:pulibrary/repecwp.git
> cd repecwp
> asdf install
> bundle install
> bundle exec rake servers:start
```

#### Create a User - Must be a valid PUL Net ID
```
> rails c
> User.create(:email => 'netid@princeton.edu', :provider => 'cas', :username => 'netid', :uid => 'netid', :role => 'admin')
```

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.


## Routing
This app expects it will be mounted at /econlib/RePEc/

## Public Downloadable Series are at
pri/serieshandle/serieshandle.rdf
