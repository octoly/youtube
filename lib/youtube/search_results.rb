require 'youtube/base'

module Youtube
  class SearchResults < Youtube::Base

    def results
      @results ||= Array(@attrs[:items]).map do |video|
        video[:id][:videoId]
      end
    end
  end
end
