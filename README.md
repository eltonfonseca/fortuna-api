<img src="https://i.imgur.com/1ryC1eb.png" align="right" width="150" height="150" />

# FORTUNA API
> Project for family financial control

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/5c72883a8f0a4189a327bc9e6746fe79)](https://app.codacy.com/manual/eltonfonseca/fortuna-api?utm_source=github.com&utm_medium=referral&utm_content=eltonfonseca/fortuna-api&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://travis-ci.com/eltonfonseca/fortuna-api.svg?branch=master)](https://travis-ci.com/eltonfonseca/fortuna-api) [![codecov](https://codecov.io/gh/eltonfonseca/fortuna-api/branch/master/graph/badge.svg)](https://codecov.io/gh/eltonfonseca/fortuna-api) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)


This project aims to manage the finances of a family, with greater control and visualization of accounts payable and accounts receivable.

## Stack

* `Ruby 3.0.0`
* `Rails 6.1.3.1`

## Development Setup

We use Docker and Ruby on Rails as technologies for developing this application. Therefore, follow the steps for setting up the development environment.

#### Application Setup

```bash
$ docker-compose build
$ docker-compose up
```
#### Database Setup

NOTE: Application must is up!

```bash
$ docker-compose exec fortuna rails db:create db:migrate
```

## Contributing

1. Fork it (<https://github.com/eltonfonseca/fortuna-api/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

## License
[MIT](https://github.com/eltonfonseca/fortuna-api/blob/master/LICENSE)
