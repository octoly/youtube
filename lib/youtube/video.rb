require 'youtube/identity'

module Youtube
  class Video < Youtube::Identity

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
      @attrs[:v3][:items][0][:snippet][:publishedAt]
    end

    def updated_at
      @attrs[:v2]['entry']['updated']
    end

    def category_id
      @attrs[:v3][:items][0][:snippet][:categoryId]
    end

    def views_count
      @attrs[:v3][:items][0][:statistics][:viewCount]
    end

    def likes_count
      @attrs[:v3][:items][0][:statistics][:likeCount]
    end

    def dislikes_count
      @attrs[:v3][:items][0][:statistics][:dislikeCount]
    end

    def favorites_count
      @attrs[:v3][:items][0][:statistics][:favoriteCount]
    end

    def comments_count
      @attrs[:v3][:items][0][:statistics][:commentCount]
    end

    def upload_status
      @attrs[:v3][:items][0][:status][:uploadStatus]
    end

    def privacy_status
      @attrs[:v3][:items][0][:status][:privacyStatus]
    end

    def topic_ids
      @attrs[:v3][:items][0][:topicDetails][:topicIds]
    end
  end
end
