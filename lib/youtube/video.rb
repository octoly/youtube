require 'time'
require 'iso8601'
require 'youtube/identity'

module Youtube
  class Video < Youtube::Identity

    def response
      @attrs
    end

    def valid_response?
      (@attrs and @attrs[:kind] == 'youtube#videoListResponse') ? true : false
    end

    def exists?
      (@attrs[:items] and item_attrs) ? true : false
    end

    def id
      item_attrs[:id]
    end

    def channel_id
      item_attrs[:snippet][:channelId]
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

    def category_id
      item_attrs[:snippet][:categoryId].to_i
    end

    def views_count
      statistics_count :viewCount
    end

    def likes_count
      statistics_count :likeCount
    end

    def dislikes_count
      statistics_count :dislikeCount
    end

    def favorites_count
      statistics_count :favoriteCount
    end

    def comments_count
      statistics_count :commentCount
    end

    def upload_status
      item_attrs[:status].nil? ? 'unknow' : item_attrs[:status][:uploadStatus]
    end

    def privacy_status
      item_attrs[:status].nil? ? 'unknow' : item_attrs[:status][:privacyStatus]
    end

    def topic_ids
      item_attrs[:topicDetails].nil? ? [] : (item_attrs[:topicDetails][:topicIds] || [])
    end

    def duration
      item_attrs[:contentDetails].nil? ? 'unknow' : ISO8601::Duration.new(item_attrs[:contentDetails][:duration]).to_seconds.to_i
    end

    def public_stats_viewable
      item_attrs[:status].nil? ? false : (item_attrs[:status][:publicStatsViewable] || false)
    end

    def relevant_topic_ids
      item_attrs[:topicDetails].nil? ? [] : (item_attrs[:topicDetails][:relevantTopicIds] || [])
    end

    def region_restriction
      item_attrs[:contentDetails].nil? ? {} : (item_attrs[:contentDetails][:regionRestriction] || {})
    end

    def live_streaming_details
      item_attrs[:liveStreamingDetails]
    end

    def live?
      !live_streaming_details.nil?
    end

  end
end
