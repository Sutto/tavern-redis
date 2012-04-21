require 'multi_json'

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
        redis.publish "event:#{name}", MultiJson.dump(context)
      end

      def start
        redis.psubscribe "event:*" do |on|
          on.pmessage do |_, channel, message|
            receive_json channel, message
          end
        end

      end

      private

      def receive_json(channel, json)
        _, name = channel.split(":", 2)
        parsed = MultiJson.load(message).inject({}) do |acc, (k,v)|
          acc[k.to_sym] = v
          acc
        end
        local_publish name, parsed 
      end

    end
  end
end