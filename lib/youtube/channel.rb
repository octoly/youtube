require 'time'
require 'iso8601'
require 'youtube/identity'

module Youtube
  class Channel < Youtube::Identity

    def response
      @attrs
    end

    def valid_response?
      (@attrs and @attrs[:kind] == 'youtube#channelListResponse') ? true : false
    end

    def exists?
      (@attrs[:items] and item_attrs) ? true : false
    end

    def id
      item_attrs[:id]
    end

    def title
      item_attrs[:snippet][:title]
    end

    def description
      item_attrs[:snippet][:description]
    end

    def published_at
      Time.parse(item_attrs[:snippet][:publishedAt])
    end

    def thumbnails
      item_attrs[:snippet][:thumbnails] || {}
    end

    def image
      item_attrs[:brandingSettings].nil? ? {} : (item_attrs[:brandingSettings][:image] || {})
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
      item_attrs[:topicDetails].nil? ? [] : (item_attrs[:topicDetails][:topicIds] || [])
    end

    def keywords
      if item_attrs[:brandingSettings].nil? or item_attrs[:brandingSettings][:channel].nil?
        nil
      else
        item_attrs[:brandingSettings][:channel][:keywords]
      end
    end

    def branding_settings
      item_attrs[:brandingSettings] || {}
    end

    def featured_channels_urls
      if branding_settings[:channel].nil?
        []
      else
        branding_settings[:channel][:featuredChannelsUrls] || []
      end
    end

  end
end
