require 'youtube/base'

module Youtube
  class Playlist < Youtube::Base

    def self.valid_response?(response)
      (response and response[:kind] == 'youtube#playlistListResponse') ? true : false
    end

    def exists?
      @attrs ? true : false
    end

    def id
      @attrs[:id]
    end

  end
end
