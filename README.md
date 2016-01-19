# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


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