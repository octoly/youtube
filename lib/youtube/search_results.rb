require 'youtube/base'

module Youtube
  class SearchResults < Youtube::Base

    # Returns a new object based on the response hash
    #
    # @param response [Hash]
    # @return [Youtube::Base]
    def self.from_response(response={})
      return unless response[:body]
      raise response[:body] unless valid_response?(response[:body])
      object = new(response[:body])
    end

    def self.valid_response?(response)
      (response and response[:kind] == 'youtube#searchListResponse') ? true : false
    end

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
      @attrs[:pageInfo] ? @attrs[:pageInfo][:totalResults].to_i : 0
    end

    def last_published_at
      if @attrs[:items] and @attrs[:items].any?
        Time.parse(@attrs[:items].last[:snippet][:publishedAt])
      else
        nil
      end
    end

  end
end