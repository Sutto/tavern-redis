require "tavern"
require "tavern/redis/version"
require 'redis'
require 'redis/namespace'

module Tavern
  module Redis
    autoload :Hub, 'tavern/redis/hub'
  end
end
