require 'youtube/api/utils'
require 'youtube/channel'

module Youtube
  module API
    module Channels
      include Youtube::API::Utils

      # Returns a Channel
      #
      # @see https://developers.google.com/youtube/v3/docs/channels/list
      # @return [Youtube::Channel] The requested Channel.
      # @param id [String] A Channel ID
      # @example Return the Channel with the ID UCMmADDDgI-dXaPGoIZ3qIsQ
      #   Youtube.channel(id: 'UCMmADDDgI-dXaPGoIZ3qIsQ')
      #
      def channel(options = {})
        call_options = [
          Youtube::Channel,
          :get,
          "/youtube/v3/channels?part=id%2C+snippet%2C+contentDetails%2C+brandingSettings%2C+statistics",
          options
        ]
        if options[:id].is_a? Array
          objects_from_response(*call_options)
        else
          object_from_response(*call_options)
        end
      end
    end
  end
end
