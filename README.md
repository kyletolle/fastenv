# Fastenv

[![Gem Version](https://badge.fury.io/rb/fastenv.svg)](http://badge.fury.io/rb/fastenv)
[![Build Status](https://travis-ci.org/kyletolle/fastenv.svg?branch=master)](https://travis-ci.org/kyletolle/fastenv)
[![Code Climate](https://codeclimate.com/github/kyletolle/fastenv/badges/gpa.svg)](https://codeclimate.com/github/kyletolle/fastenv)
[![Dependency Status](https://gemnasium.com/kyletolle/fastenv.svg)](https://gemnasium.com/kyletolle/fastenv)

Fast access to environment variables. Takes advantage of method_missing to
easily return values of environment variable.

Why? Because TYPING_IN_ALL_CAPS isn't fun or readable.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fastenv'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install fastenv
```

## Usage

Say you have an environment variable

```bash
WORDPRESS_USERNAME="La-de-da-de-da"
```

You can access it from your Ruby code as simply as

```ruby
require 'fastenv'

Fastenv.wordpress_username
```

If the environment variable doesn't exist, a `NameError` will be raise.

Fastenv is intended for querying credentials. Missing credentials is an
exceptional event.

### Defaults

It can be helpful to specify default values though. You can give Fastenv a
block, and, if the environment variable is not set, the block will be evaluated
and its value returned.

```ruby
require 'fastenv'

your_special_value = Fastenv.env_does_not_exist { 'but this is a default' }
=> "but this is a default"
```

---

## Goes Well With

Pair it with [dotenv](https://github.com/bkeepers/dotenv) to easily set _and_
retrieve your credentials from environment variables.

```bash
# .env
WORDPRESS_USERNAME="TweedleDee"
WORDPRESS_PASSWORD="password"
```

```ruby
# your_app.rb
require 'dotenv'
Dotenv.load

require 'fastenv'

credentials = {
  username: Fastenv.wordpress_username,
  password: Fastenv.wordpress_password }
# => {:username=>"TweedleDee", :password=>"password"}
```

## Contributing

1. Fork it ( https://github.com/kyletolle/fastenv/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

