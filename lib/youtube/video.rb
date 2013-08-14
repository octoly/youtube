require 'time'
require 'iso8601'
require 'youtube/identity'

module Youtube
  class Video < Youtube::Identity

    def exists?
      (@attrs[:v3][:items] and @attrs[:v3][:items][0]) ? true : false
    end

    def id
      @attrs[:v3][:items][0][:id]
    end

    def channel_id
      @attrs[:v3][:items][0][:snippet][:channelId]
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

    def category_id
      @attrs[:v3][:items][0][:snippet][:categoryId].to_i
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
      if @attrs[:v3][:items][0][:status].nil?
        'unknow'
      else
        @attrs[:v3][:items][0][:status][:uploadStatus]
      end
    end

    def privacy_status
      if @attrs[:v3][:items][0][:status].nil?
        'unknow'
      else
        @attrs[:v3][:items][0][:status][:privacyStatus]
      end
    end

    def topic_ids
      if @attrs[:v3][:items][0][:topicDetails].nil?
        []
      else
        @attrs[:v3][:items][0][:topicDetails][:topicIds] || []
      end
    end

    def duration
      if @attrs[:v3][:items][0][:contentDetails].nil?
        'unknow'
      else
        ISO8601::Duration.new(@attrs[:v3][:items][0][:contentDetails][:duration]).to_seconds.to_i
      end
    end

    def public_stats_viewable
      if @attrs[:v3][:items][0][:status].nil?
        false
      else
        @attrs[:v3][:items][0][:status][:publicStatsViewable] || false
      end
    end

  end
end
