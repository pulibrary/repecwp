# PURPOSE

This application provides data about economics working papers that Princeton publishes to the [Research Papers in Economics (RePEc) project.](http://repec.org/). It uses a format called [Research Documents Information Format (ReDIF)](https://openlib.org/acmes/root/docu/redif_1.html).

[![CircleCI](https://circleci.com/gh/pulibrary/repecwp/tree/main.svg?style=svg)](https://circleci.com/gh/pulibrary/repecwp/tree/main)
[![Coverage Status](https://coveralls.io/repos/github/pulibrary/repecwp/badge.svg?branch=main)](https://coveralls.io/github/pulibrary/repecwp?branch=main)

## Set Up Development Environment

### Option A (recommended): Devbox

This repo includes a `devbox.json` that provides Ruby/Node and native build dependencies (pg, libyaml, etc.) so you don’t need to install them globally.

1) Clone the repo

  ```sh
  git clone git@github.com:pulibrary/repecwp.git
  cd repecwp
  ```

2. Start a Devbox shell (installs dependencies the first time)

  ```sh
  devbox shell
  ```

3. Start PostgreSQL (Devbox-managed) and prepare the database

  ```sh
  devbox run pg:init
  devbox run pg:start
  bundle exec rails db:prepare
  ```

4. Run the app

  ```sh
  bundle exec rails server
  ```

Some common devbox commands:

```sh
# run tests
bundle exec rspec

# stop postgres
devbox run pg:stop
```

> Notes:

* If you use Devbox, you do not need `asdf install.`

* Postgres runs via devbox services and stores its data under the repo’s .devbox/ directory.

### Option B: asdf (existing workflow)

If you prefer asdf-managed Ruby/Node:

```sh
git clone git@github.com:pulibrary/repecwp.git
cd repecwp
asdf install
bundle install
bundle exec rake servers:start
```

#### Create a User (must be a valid PUL Net ID)

```sh
rails c
User.create(
  email: 'netid@princeton.edu',
  provider: 'cas',
  username: 'netid',
  uid: 'netid',
  role: 'admin'
)
```

#### Routing

This app expects it will be mounted at /econlib/RePEc/.

#### Public Downloadable Series are at

`pri/serieshandle/serieshandle.rdf`

Please feel free to use a different markup language if you do not plan to run `rake doc:app.`
