# README

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
