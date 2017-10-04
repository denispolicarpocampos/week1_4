# Week 01 - Team 04 - CHALLENGE
====================================================

![ruby](https://img.shields.io/badge/Ruby-2.4.2-red.svg)
![rails](https://img.shields.io/badge/Rails-5.1.4-red.svg)
![rails](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)

# Require
```
  * Docker
  * Docker Compose
  * Postgresql
```

## How to contribute to the project

### 1. Do a fork at original repository
```
https://github.com/llsantana/week1_4
```

### 2. Add the remote repository source at your local repositoy
```
$ git remote add upstream git@github.com:llsantana/week1_4.git
```

### 3. Sync your repository with the original repository
```
$ git fetch upstream
```

### 4. Update your local repository
```
$ git checkout master
$ git merge upstream/master
```

### 5. You must create a PostgreSQL extension
We are using PostgreSQL and gem PgSearch to improve our database workload.
This gem uses two important Postgres extensions to enable features to improve research, and these are `pg_trgm` and `fuzzystrmatch`

To install these extensions, enter in your database and run:
```
CREATE EXTENSION pg_trgm;
CREATE EXTENSION fuzzystrmatch;
```

### 6. Work on it and send changes to your fork

### 7. Do a pull request at your fork on GitHub
