require 'faraday'
require 'youtube/api/search'
require 'youtube/api/videos'
require 'youtube/api/channels'
require 'youtube/configurable'
require 'youtube/error/client_error'
require 'youtube/error/decode_error'

module Youtube
  class Client
    include Youtube::API::Search
    include Youtube::API::Videos
    include Youtube::API::Channels
    include Youtube::Configurable

    def initialize(options={})
      Youtube::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Youtube.instance_variable_get(:"@#{key}"))
      end
    end

    # Perform an HTTP GET request
    def get(path, params={})
      request(:get, path, params)
    end

  private

    # Returns a proc that can be used to setup the Faraday::Request headers
    #
    # @param method [Symbol]
    # @param path [String]
    # @param params [Hash]
    # @return [Proc]
    def request_setup(method, path, params)
      Proc.new do |request|
      end
    end

    def request(method, path, params={}, signature_params=params)
      @endpoint = @endpoint_options[params[:endpoint].to_sym]
      path = "#{path}&key=#{@developer_key}"
      request_setup = request_setup(method, path, params)
      connection.send(method.to_sym, path, params, &request_setup).env
      # rescue Faraday::Error::ClientError
      #   raise Youtube::Error::ClientError
      # rescue MultiJson::DecodeError
      #   raise Youtube::Error::DecodeError
    end

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      @connection = begin
        connection_options = {:builder => @middleware}
        connection_options[:ssl] = {:verify => true} if @endpoint[0..4] == 'https'
        Faraday.new(@endpoint, @connection_options.merge(connection_options))
      end
    end
  end
end
