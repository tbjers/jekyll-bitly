# Jekyll::Bitly

This gem provides a Bit.ly filter plugin for Jekyll.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-bitly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-bitly

Finally, add the following to your `_config.yml` file:

```yaml
gems:
  - jekyll-bitly
```

## Usage

Use the `bitly` tag in your Jekyll pages like this:

```erb
[Bit.ly gem]({{ 'https://github.com/philnash/bitly' | bitly }})
```

Get your API token from https://app.bitly.com/settings/api/
After that there are two ways to setup the token
1. Using Jekyll config: `_config.yml` (has more priority than the second one)

```
bitly:
  token: xxxxxxxxxxxxxxxxxxxx
```

2. Using Environment Variable
add `BITLY_TOKEN` to be available in your environment

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tbjers/jekyll-bitly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

