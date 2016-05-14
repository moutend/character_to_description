# CharacterToDescription

Converting a character into its description.
This gem currently targets a Japanese character.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'character_to_description'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install character_to_description

## Usage

```ruby
>> require 'character_to_description'
>> puts 'あ'.to_description
```

## Development

After checking out the repository, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/character_to_description.

