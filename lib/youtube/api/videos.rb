require 'youtube/api/utils'
require 'youtube/video'

module Youtube
  module API
    module Videos
      include Youtube::API::Utils

      # Returns a Video
      #
      # @see https://developers.google.com/youtube/v3/docs/videos/list
      # @return [Youtube::Video] The requested Video.
      # @param id [Integer] A Video ID
      # @example Return the Video with the ID ywBRKW93m0I
      #   Youtube.video('ywBRKW93m0I')
      #
      def video(id, options = {})
        object_from_responses(
          Youtube::Video,
          :get,
          {
            v2: "/feeds/api/videos/#{id}?v=2",
            v3: "/youtube/v3/videos?part=id%2Csnippet&id=#{id}",
          },
          options
        )
#        object_from_responses(Youtube::Video, :get, "/feeds/api/videos/#{id}?v=2", options)
      end
    end
  end
end
