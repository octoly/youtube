require "youtube/client"
require "youtube/configurable"
require "youtube/default"
require "youtube/version"

module Youtube
  class << self
    include Youtube::Configurable

    # Delegate to a Twitter::Client
    #
    # @return [Twitter::Client]
    def client
      @client = Youtube::Client.new(options) unless defined?(@client) && @client.hash == options.hash
      @client
    end
  end
end
