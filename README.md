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

## Clean up Abstracts Table

UPDATE mytable SET `title` = TRIM(REPLACE(REPLACE(REPLACE(`title`, '\n', ' '), '\r', ' '), '\t', ' '));


* run the above for all text fields
```
f = File.read('/Users/kevinreiss/Projects/repec/workingpapers.1-18-16.csv').gsub(/\\"/,'""')
require 'csv'
rows = CSV.parse(f, headers: true, header_converters: :symbol)
```
To load the above data use:

```
rows.each do |row|
  Paper.create! row.to_hash
end
```

## Routing
This app expects it will be mounted at /econlib/RePEc/

## Public Downloadable Series are at
pri/serieshandle/serieshandle.rdf