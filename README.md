<img src="https://i.imgur.com/xAkoVOd.png" align="right" width="100" height="110" />

# FORTUNA API
> Project for family financial control

[![Build Status](https://travis-ci.com/eltonfonseca/fortuna-api.svg?branch=master)](https://travis-ci.com/eltonfonseca/fortuna-api) [![codecov](https://codecov.io/gh/eltonfonseca/fortuna-api/branch/master/graph/badge.svg)](https://codecov.io/gh/eltonfonseca/fortuna-api)


This project aims to manage the finances of a family, with greater control and visualization of accounts payable and accounts receivable.

## Stack

* `Ruby 2.7.1`
* `Rails 6.0.3.2`

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
