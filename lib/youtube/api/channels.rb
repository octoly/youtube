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
        channel = object_from_responses(
          Youtube::Channel,
          :get,
          {
            # v2: "/feeds/api/users/#{id}?v=2",
            v3: "/youtube/v3/channels?part=id%2C+snippet%2C+contentDetails%2C+brandingSettings%2C+statistics%2C+invideoPromotion%2C+topicDetails",
          },
          options
        )
        channel.exists? ? channel : nil
      end
    end
  end
end
