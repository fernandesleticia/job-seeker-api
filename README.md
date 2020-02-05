# Job Seeker API

>A API that provides an easy and intuitive method of create, activate and list vacancies.
The demo is running on [Demo]()

## Technologies
> The project was developed using Ruby On Rails.

## Basic instructions

* Ruby version
> up to 2.5.0

* Rails version
> up to 5.2.0

* Running the seed for dummy data
```bash
$ rails db:seed
```
* How to run the test suite
```bash
$ bundle exec rspec
```

## Dependencies
* rspec-rails - A testing framework found at https://github.com/rspec/rspec-rails
* factory_bot_rails - A fixtures replacement with a more straightforward syntax found at https://github.com/thoughtbot/factory_bot_rails
* shoulda_matchers - Provides RSpec with additional matchers. Found at https://github.com/thoughtbot/shoulda-matchers
* faker - A library for generating fake data found at https://github.com/faker-ruby/faker
* database_cleaner - It literally cleans our test database to ensure a clean state in each test suite. Found at https://github.com/DatabaseCleaner/database_cleaner

## Routes

* activate the vacancies 
> '/vacancies/:id/activate'
* get the info by category 
> '/category/:id'
* load the jobs from job-seeker-server
>'/loadJobs'

## Dockerizing 

* Create the Dockerfile and the entrypoint.sh
* Create the docker-compose.yml:
```YAML
version: '3'
services:
  db:
    image: postgres
    volumes: 
     - ./tmp/db:/var/lib/postgresql/data
  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on: 
      - db
    environment:
      - DD_API_KEY=YOUR_DOCKER_API_KEY
      - DD_APM_ENABLED=true
```

* Point the database.yml to the database container:
```YAML
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: levee_development


test:
  <<: *default
  database: levee_test
```
* Read your docker-compose.yml and bring up application services inside of the container:
```bash
$ sudo docker-compose up --build
```
* Create the database instances:
```bash
$ sudo docker-compose run web bundle exec rake db:create

$ sudo docker-compose run web bundle execrake db:migrate
```
