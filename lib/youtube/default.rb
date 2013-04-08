require 'youtube/configurable'

module Youtube
  module Default
    class << self

      # @return [Hash]
      def options
        Hash[Youtube::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # @return [String]
      def developer_key
        ENV['YOUTUBE_DEVELOPER_KEY']
      end
    end
  end
end
