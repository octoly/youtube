require 'time'
require 'iso8601'
require 'youtube/identity'

module Youtube
  class Channel < Youtube::Identity

    def self.valid_response?(response)
      (response and response[:kind] == 'youtube#channelListResponse') ? true : false
    end

    def valid_item?
      (@attrs and @attrs[:kind] == 'youtube#channel') ? true : false
    end

    def exists?
      @attrs ? true : false
    end

    def id
      @attrs[:id]
    end

    def title
      @attrs[:snippet][:title]
    end

    def description
      @attrs[:snippet][:description]
    end

    def published_at
      @attrs[:snippet][:publishedAt] ? Time.parse(@attrs[:snippet][:publishedAt]) : nil
    end

    def thumbnails
      @attrs[:snippet][:thumbnails] || {}
    end

    def image
      @attrs[:brandingSettings].nil? ? {} : (@attrs[:brandingSettings][:image] || {})
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

    def hidden_subscriber_count
      statistics_value :hiddenSubscriberCount
    end

    def comments_count
      statistics_count :commentCount
    end

    def keywords
      if @attrs[:brandingSettings].nil? or @attrs[:brandingSettings][:channel].nil?
        nil
      else
        @attrs[:brandingSettings][:channel][:keywords]
      end
    end

    def topic_ids
      @attrs[:topicDetails].nil? ? [] : (@attrs[:topicDetails][:topicIds] || [])
    end

    def branding_settings
      @attrs[:brandingSettings] || {}
    end

    def featured_channels_urls
      if branding_settings[:channel].nil?
        []
      else
        branding_settings[:channel][:featuredChannelsUrls] || []
      end
    end

    def related_playlists
      if @attrs[:contentDetails] and @attrs[:contentDetails][:relatedPlaylists]
        @attrs[:contentDetails][:relatedPlaylists]
      else
        {}
      end
    end

    def country
      if @attrs[:snippet][:country]
        @attrs[:snippet][:country]
      else
        @attrs[:brandingSettings].nil? || @attrs[:brandingSettings][:channel].nil? ? nil : @attrs[:brandingSettings][:channel][:country]
      end
    end

  end
end
