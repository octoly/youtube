require 'youtube/api/utils'
require 'youtube/playlist_items'

module Youtube
  module API
    module PlaylistItems
      include Youtube::API::Utils

      # Returns a PlaylistItems
      #
      # @see https://developers.google.com/youtube/v3/docs/playlistItems/list
      # @return [Youtube::PlaylistItem] The requested PlaylistItems.
      # @param playlistId [String] A Playlist ID
      # or
      # @param id [String] A PlaylistItem ID
      # @example Return the PlaylistItems with the playlistId UUzzyzxDOgrMBgwPDoXs8R4g
      #   Youtube.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g')
      # @example Return the PlaylistItems with the ID UUXo0KJ3CT-E2avjl5c7rmf3A7FDeMXlIV
      #   Youtube.playlist_items(id: 'UUXo0KJ3CT-E2avjl5c7rmf3A7FDeMXlIV')
      #
      def playlist_items(options = {})
        call_options = [
          Youtube::PlaylistItems,
          :get,
          "/youtube/v3/playlistItems?part=id%2C+snippet%2C+contentDetails%2C+status",
          { maxResults: 50 }.merge(options)
        ]
        object_from_response(*call_options)
      end
    end
  end
end
