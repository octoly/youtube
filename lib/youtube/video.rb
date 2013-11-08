require 'time'
require 'iso8601'
require 'youtube/identity'

module Youtube
  class Video < Youtube::Identity

    def exists?
      (@attrs[:v3][:items] and v3_item_attrs) ? true : false
    end

    def id
      v3_item_attrs[:id]
    end

    def channel_id
      v3_item_attrs[:snippet][:channelId]
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

    def category_id
      v3_item_attrs[:snippet][:categoryId].to_i
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
      v3_item_attrs[:status].nil? ? 'unknow' : v3_item_attrs[:status][:uploadStatus]
    end

    def privacy_status
      v3_item_attrs[:status].nil? ? 'unknow' : v3_item_attrs[:status][:privacyStatus]
    end

    def topic_ids
      v3_item_attrs[:topicDetails].nil? ? [] : (v3_item_attrs[:topicDetails][:topicIds] || [])
    end

    def duration
      v3_item_attrs[:contentDetails].nil? ? 'unknow' : ISO8601::Duration.new(v3_item_attrs[:contentDetails][:duration]).to_seconds.to_i
    end

    def public_stats_viewable
      v3_item_attrs[:status].nil? ? false : (v3_item_attrs[:status][:publicStatsViewable] || false)
    end

    def relevant_topic_ids
      v3_item_attrs[:topicDetails].nil? ? [] : (v3_item_attrs[:topicDetails][:relevantTopicIds] || [])
    end

    def region_restriction
      v3_item_attrs[:contentDetails].nil? ? {} : (v3_item_attrs[:contentDetails][:regionRestriction] || {})
    end

    def live_streaming_details
      v3_item_attrs[:liveStreamingDetails]
    end

    def live?
      !live_streaming_details.nil?
    end

  end
end
