# Week 01 - Team 04 - CHALLENGE

## How to run it?

These are baby steps to stark running this application after clone it on your local dir

1. Build containers
`docker-compose build`

2. Start containers
`docker-compose up -d`

3. Create database on database container
`docker-compose run website bundle exec rails db:create`

4. Run migrations on database container
`docker-compose run website bundle exec rails db:migrate`
