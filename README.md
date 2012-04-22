# tavern-redis

Tavern Redis lets you publish and receive tavern messages over redis. Useful for situations where
you want to implement simple pubsub with ruby-like semantics over a network. Magic!

## Installation

Add this line to your application's Gemfile:

    gem 'tavern-redis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tavern-redis

## Usage

Inside your application, simple set your hub to a `Tavern::Redis::Hub` instance:

```ruby
Tavern.hub = Tavern::Redis::Hub.new Redis.new
```

Next, in a script where you want the subscribers to work, run:

```ruby
Tavern.hub.start
```

Whilst using the hub as normal in your main application

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
