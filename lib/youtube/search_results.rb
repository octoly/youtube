require 'youtube/base'

module Youtube
  class SearchResults < Youtube::Base

    def results
      @results ||= Array(@attrs[:items]).map do |item|
        item_kind = item[:id][:kind].split('#').last
        item[:id]["#{item_kind}Id".to_sym]
      end
    end

    def next_page_token
      @attrs[:nextPageToken]
    end

    def total_results
      @attrs[:pageInfo][:totalResults]
    end

    def last_published_at
      if total_results > 0
        Time.parse(@attrs[:items].last[:snippet][:publishedAt])
      else
        nil
      end
    end

  end
end