require 'youtube/base'

module Youtube
  class PlaylistItems < Youtube::Base

    # Returns a new object based on the response hash
    #
    # @param response [Hash]
    # @return [Youtube::Base]
    def self.from_response(response={})
      return unless response[:body]
      raise Youtube::Error::ServerError.from_response(response) unless valid_response?(response[:body])
      object = new(response[:body])
    end

    def self.valid_response?(response)
      (response and response[:kind] == 'youtube#playlistItemListResponse') ? true : false
    end

    def video_ids
      @results ||= Array(@attrs[:items]).map do |item|
        item[:snippet][:resourceId][:videoId]
      end
    end

    def published_at
      @results ||= Array(@attrs[:items]).map do |item|
        item[:snippet][:publishedAt]
      end
    end

    def next_page_token
      @attrs[:nextPageToken]
    end

    def total_results
      @attrs[:pageInfo] ? @attrs[:pageInfo][:totalResults].to_i : 0
    end

  end
end
