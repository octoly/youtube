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
        call_options = [
          Youtube::Video,
          :get,
          "/youtube/v3/videos?part=id%2C+snippet%2C+contentDetails%2C+statistics%2C+status",
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
