# CharacterToDescription

This gem converts a Japanese character into its description by using the dictionary for NVDA, the screen reader for Windows.
There are many characters that are pronounced as the same in Japanese so that this gem currently targets to Japanese characters.

## Usage

Install the gem by the following command:

```shell
$ gem install character_to_description
```

Now you can convert a character into its description.

```ruby
require 'character_to_description'

class String
  include CharacterToDescription
end

puts 'あ'.to_description #=> ひらがなの「あ」
```

## Development

After checking out the repository, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/character_to_description.

## LICENSE

GPL
