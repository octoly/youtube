require 'youtube/base'

module Youtube
  class SearchResults < Youtube::Base

    def results
      @results ||= Array(@attrs[:items]).map do |video|
        video[:id][:videoId]
      end
    end

    def next_page_token
      @attrs[:nextPageToken]
    end

    def last_published_at
      Time.parse(@attrs[:items].last[:snippet][:publishedAt])
    end
  end
end
