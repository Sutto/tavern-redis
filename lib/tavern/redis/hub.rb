require 'json'

module Tavern
  module Redis
    class Hub < Tavern::Hub

      attr_reader :redis

      def initialize(redis)
        @redis = redis
        super()
      end

      alias local_publish publish

      # Now, provide our own local publish.
      def publish(name, context = {})
        p [redis, "event:#{name}"]
        redis.publish "event:#{name}", JSON.dump(context)
      end

      def start
        redis.psubscribe "event:*" do |on|
          on.pmessage do |_, channel, message|
            _, name = channel.split(":", 2)
            parsed = JSON.parse(message).inject({}) do |acc, (k,v)|
              acc[k.to_sym] = v
              acc
            end
            local_publish name, parsed 
          end
        end

      end

    end
  end
end