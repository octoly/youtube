require 'time'
require 'iso8601'
require 'youtube/identity'

module Youtube
  class Video < Youtube::Identity

    def self.valid_response?(response)
      (response and response[:kind] == 'youtube#videoListResponse') ? true : false
    end

    def valid_item?
      (@attrs and @attrs[:kind] == 'youtube#video') ? true : false
    end

    def exists?
      @attrs ? true : false
    end

    def id
      @attrs[:id]
    end

    def channel_id
      @attrs[:snippet][:channelId]
    end

    def title
      @attrs[:snippet][:title]
    end

    def description
      @attrs[:snippet][:description]
    end

    def published_at
      Time.parse(@attrs[:snippet][:publishedAt])
    end

    def thumbnails
      @attrs[:snippet][:thumbnails] || {}
    end

    def category_id
      @attrs[:snippet][:categoryId].to_i
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

    def topic_ids
      @attrs[:topicDetails].nil? ? [] : (@attrs[:topicDetails][:topicIds] || [])
    end

    def duration
      @attrs[:contentDetails].nil? ? nil : ISO8601::Duration.new(@attrs[:contentDetails][:duration]).to_seconds.to_i
    end

    def relevant_topic_ids
      @attrs[:topicDetails].nil? ? [] : (@attrs[:topicDetails][:relevantTopicIds] || [])
    end

    def region_restriction
      @attrs[:contentDetails].nil? ? {} : (@attrs[:contentDetails][:regionRestriction] || {})
    end

    def live_streaming_details
      @attrs[:liveStreamingDetails]
    end

    def privacy_status
      status_value :privacyStatus
    end

    def upload_status
      status_value :uploadStatus
    end

    def rejected?
      upload_status == 'rejected'
    end
    def rejection_reason
      status_value :rejectionReason
    end

    def license
      status_value :license
    end

    def live?
      !live_streaming_details.nil?
    end

  end
end
