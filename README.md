# Specfactor

Specfactor is a gem that generates commonly used tests for commonly used controller actions.

## Installation

Specfactor is dependent on these gems: 

    rspec-rails
    activesupport
    factory_bot_rails
    
Provided you are developing on Rails, activesupport should be included by default.
Specfactor generates tests that utilize factories, and so FactoryBot is recommended. Otherwise, simply comment out/delete parts of the tests you don't want to use.

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

After entering the name, Specfactor will ask for the names of actions you'd like to generate tests for. SF can generate all common RESTful action tests such as :index, :show, :new, :create, :edit, :update, and :destroy.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/viktharien/specfactor.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
