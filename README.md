# MultiSessionCacheStore

This gem makes your rails application support multi sessions from different tabs in the same browser

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multi_session_cache_store'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multi_session_cache_store

## Usage

Add session_store.rb to initializers with the following example configuration:

```ruby
   Rails.application.config.session_store :multi_session_cache_store, {
     key: "_customer_registry_session",
     param: "msid",
     serializer: JSON
   }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mihdavid/multi_session_cache_store.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
