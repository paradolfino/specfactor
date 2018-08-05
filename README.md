# Specfactor

Specfactor is a gem that generates commonly used tests for commonly used controller actions.

## Installation

This gem is dependent on. Provided you are developing on Rails, activesupport should be included by default:

    rspec-rails
    activesupport

Add this line to your application's Gemfile:

```ruby
gem 'specfactor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install specfactor

## Usage

In terminal, type

    specfactor
    
This will prompt you to enter the name of the controller, such as "users_controller", which will produce a "users_controller_spec.rb" file under "spec/controllers" if it does not already exist.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/viktharien/specfactor.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
