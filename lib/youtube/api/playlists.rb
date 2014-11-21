require 'youtube/api/utils'
require 'youtube/playlist'

module Youtube
  module API
    module Playlists
      include Youtube::API::Utils

      # Returns a Playlist
      #
      # @see https://developers.google.com/youtube/v3/docs/playlists/list
      # @return [Youtube::Playlist] The requested Playlists.

      def playlists(options = {})
        call_options = [
          Youtube::Playlist,
          :get,
          "/youtube/v3/playlists?part=id,snippet",
          { maxResults: 50 }.merge(options)
        ]
        objects_from_response(*call_options)
      end
    end
  end
end
