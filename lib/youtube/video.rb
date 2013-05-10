require 'youtube/identity'

module Youtube
  class Video < Youtube::Identity

    def id
      @attrs[:v3][:items][0][:id]
    end

  end
end
