require 'youtube/configurable'
require 'youtube/error/server_error'
require 'youtube/request/multipart_with_file'
require 'youtube/response/parse'
require 'youtube/response/raise_error'
require 'youtube/version'

module Youtube
  module Default
    ENDPOINT_OPTIONS = {
      v3: 'https://www.googleapis.com',
    }
    CONNECTION_OPTIONS = {
      :headers => {
        # :accept => 'application/json',
        :user_agent => "Youtube Ruby Gem #{Youtube::Version}",
      },
      :request => {
        :open_timeout => 50,
        :timeout => 500,
      },
      :ssl => {
        :verify => false
      },
    } unless defined? Youtube::Default::CONNECTION_OPTIONS
    IDENTITY_MAP = false unless defined? Youtube::Default::IDENTITY_MAP
    MIDDLEWARE = Faraday::Builder.new do |builder|
      # Convert request params to "www-form-urlencoded"
      builder.use Faraday::Request::UrlEncoded
      # Handle 4xx server responses
      builder.use Youtube::Response::RaiseError, Youtube::Error::ClientError
      # Parse JSON response bodies using MultiJson
      builder.use Youtube::Response::Parse
      # Parse XML response bodies using MultiXml
      # builder.use Youtube::Response::ParseXml
      # Handle 5xx server responses
      builder.use Youtube::Response::RaiseError, Youtube::Error::ServerError
      # Set Faraday's HTTP adapter
      builder.adapter Faraday.default_adapter
    end unless defined? Youtube::Default::MIDDLEWARE

    class << self

      # @return [Hash]
      def options
        Hash[Youtube::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # @return [String]
      def developer_key
        ENV['YOUTUBE_DEVELOPER_KEY']
      end

      # @return [String]
      def endpoint_options
        ENDPOINT_OPTIONS
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      def identity_map
        IDENTITY_MAP
      end

      # @note Faraday's middleware stack implementation is comparable to that of Rack middleware.  The order of middleware is important: the first middleware on the list wraps all others, while the last middleware is the innermost one.
      # @see https://github.com/technoweenie/faraday#advanced-middleware-usage
      # @see http://mislav.uniqpath.com/2011/07/faraday-advanced-http/
      # @return [Faraday::Builder]
      def middleware
        MIDDLEWARE
      end
    end
  end
end
