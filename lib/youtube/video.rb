require 'time'
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
      Time.parse(@attrs[:v3][:items][0][:snippet][:publishedAt])
    end

    def updated_at
      Time.parse(@attrs[:v2]['entry']['updated'])
    end

    def category_id
      @attrs[:v3][:items][0][:snippet][:categoryId].to_i
    end

    def views_count
      if @attrs[:v3][:items][0][:statistics].nil?
        0
      else
        @attrs[:v3][:items][0][:statistics][:viewCount].to_i
      end
    end

    def likes_count
      if @attrs[:v3][:items][0][:statistics].nil?
        0
      else
        @attrs[:v3][:items][0][:statistics][:likeCount].to_i
      end
    end

    def dislikes_count
      if @attrs[:v3][:items][0][:statistics].nil?
        0
      else
        @attrs[:v3][:items][0][:statistics][:dislikeCount].to_i
      end
    end

    def favorites_count
      if @attrs[:v3][:items][0][:statistics].nil?
        0
      else
        @attrs[:v3][:items][0][:statistics][:favoriteCount].to_i
      end
    end

    def comments_count
      if @attrs[:v3][:items][0][:statistics].nil?
        0
      else
        @attrs[:v3][:items][0][:statistics][:commentCount].to_i
      end
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
        @attrs[:v3][:items][0][:topicDetails][:topicIds]
      end
    end
  end
end
