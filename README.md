# Palveluvayla

This is simple palveluväylä/x-road API client for ruby.
It uses excellent Savon SOAP client underneath, https://github.com/savonrb/savon

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'palveluvayla'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install palveluvayla

## Usage

Initialize client with following parameters:
* service_instance
* service_member_class
* service_member_code
* service_sub_system_code
* service_code
* service_version
* security_server_url
* client_instance
* client_member_class
* client_member_code
* client_sub_system_code
* user_id

```ruby
configuration = {
  service_instance: 'FI-DEV',
  service_member_class: 'GOV',
  service_member_code: '0245437-2',
  service_sub_system_code: 'TestService',
  service_code: 'getRandom',
  service_version: 'v1',
  security_server_url: 'https://1.2.3.4',
  client_instance: 'FI-DEV',
  client_member_class: 'COM',
  client_member_code: '123456-7',
  client_sub_system_code: 'TestSystem',
  user_id: 'test',
  id: 'ID11234'
}

client = Palveluvayla::Client.new(configuration)

client.operations
# => [:get_random]

# call the 'getRandom' operation
response = client.call(:getRandom)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/kakoni/xroad-ruby-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
