# README

This README would normally document whatever steps are necessary to get the
application up and running.



## Ruby version
``
ruby 2.6.3p62 (2019-04-16 revision 67580)
``

## System dependencies
* Postgresql

## Configuration
* Update database credential on config/database.yml

## Database creation
``
rails db:create
``

## Database initialization
``
rails db:migrate
``

## How to run the test suite
``
TBD
``

## Services (job queues, cache servers, search engines, etc.)
``
TBD
``

## Deployment instructions
``
TBD
``

## API Documentation
    http://localhost:3000/api-docs/

Run this command to generate new API Documentation

``
rake rswag:specs:swaggerize
``


## Prettier Ruby Plugin
``
bundle exec rbprettier --write '**/*.rb'
``
