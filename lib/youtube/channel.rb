require 'time'
require 'iso8601'
require 'youtube/identity'

module Youtube
  class Channel < Youtube::Identity

    def exists?
      (@attrs[:v3][:items] and @attrs[:v3][:items][0]) ? true : false
    end

    def id
      @attrs[:v3][:items][0][:id]
    end

    def title
      @attrs[:v3][:items][0][:snippet][:title]
    end

    def description
      @attrs[:v3][:items][0][:snippet][:description]
    end

    def published_at
      Time.parse(@attrs[:v3][:items][0][:snippet][:publishedAt])
    end

    def thumbnails
      @attrs[:v3][:items][0][:snippet][:thumbnails] || {}
    end

    def views_count
      statistics_count :viewCount
    end

    def videos_count
      statistics_count :videoCount
    end

    def subscribers_count
      statistics_count :subscriberCount
    end

    def comments_count
      statistics_count :commentCount
    end

    def topic_ids
      if @attrs[:v3][:items][0][:topicDetails].nil?
        []
      else
        @attrs[:v3][:items][0][:topicDetails][:topicIds] || []
      end
    end

    def keywords
      if @attrs[:v3][:items][0][:brandingSettings].nil? or @attrs[:v3][:items][0][:brandingSettings][:channel].nil?
        nil
      else
        @attrs[:v3][:items][0][:brandingSettings][:channel][:keywords]
      end
    end

    def featured_channels_urls
      if @attrs[:v3][:items][0][:brandingSettings].nil? or @attrs[:v3][:items][0][:brandingSettings][:channel].nil?
        []
      else
        @attrs[:v3][:items][0][:brandingSettings][:channel][:featuredChannelsUrls] || []
      end
    end

  end
end
