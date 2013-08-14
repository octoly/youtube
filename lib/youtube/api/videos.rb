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
      # @param id [String] A Video ID
      # @example Return the Video with the ID ywBRKW93m0I
      #   Youtube.video(id: 'ywBRKW93m0I')
      #
      def video(options = {})
        video = object_from_responses(
          Youtube::Video,
          :get,
          {
            # v2: "/feeds/api/videos/#{id}?v=2",
            v3: "/youtube/v3/videos?part=id%2C+snippet%2C+contentDetails%2C+player%2C+statistics%2C+status%2C+topicDetails",
          },
          options
        )
        video.exists? ? video : nil
      end
    end
  end
end
