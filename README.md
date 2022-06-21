# README

## Development

- Install PostgreSQL using docker

  `$ docker-compose up -d db`
- Ruby version `2.7.4`
- Run bundler

  `$ bundle install`

- Run database migration

  `$ rails db:create db:migrate`

- Run server

  `$ rails server -p 3000 -b 0.0.0.0`

## Prepare watches data

`$ rake crawler:watches`

Watches data [docs](https://rapidapi.com/makingdatameaningful/api/watch-database1/)