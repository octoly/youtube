require 'time'
require 'iso8601'
require 'youtube/identity'

module Youtube
  class Channel < Youtube::Identity

    def exists?
      (@attrs[:v3][:items] and v3_item_attrs) ? true : false
    end

    def id
      v3_item_attrs[:id]
    end

    def title
      v3_item_attrs[:snippet][:title]
    end

    def description
      v3_item_attrs[:snippet][:description]
    end

    def published_at
      Time.parse(v3_item_attrs[:snippet][:publishedAt])
    end

    def thumbnails
      v3_item_attrs[:snippet][:thumbnails] || {}
    end

    def image
      v3_item_attrs[:brandingSettings].nil? ? {} : (v3_item_attrs[:brandingSettings][:image] || {})
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
      v3_item_attrs[:topicDetails].nil? ? [] : (v3_item_attrs[:topicDetails][:topicIds] || [])
    end

    def keywords
      if v3_item_attrs[:brandingSettings].nil? or v3_item_attrs[:brandingSettings][:channel].nil?
        nil
      else
        v3_item_attrs[:brandingSettings][:channel][:keywords]
      end
    end

    def featured_channels_urls
      if v3_item_attrs[:brandingSettings].nil? or v3_item_attrs[:brandingSettings][:channel].nil?
        []
      else
        v3_item_attrs[:brandingSettings][:channel][:featuredChannelsUrls] || []
      end
    end

  end
end
