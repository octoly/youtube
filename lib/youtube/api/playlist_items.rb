require 'youtube/api/utils'
require 'youtube/playlist_items'

module Youtube
  module API
    module PlaylistItems
      include Youtube::API::Utils

      def playlist_items(options = {})
        objects_from_response(
          Youtube::PlaylistItems,
          :get,
          "/youtube/v3/playlistItems?part=id%2C+snippet%2C+contentDetails%2C+status",
          options
        )
      end
    end
  end
end
