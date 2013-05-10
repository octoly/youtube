require 'youtube/error'

module Youtube
  class Error
    # Raised when JSON parsing fails
    class DecodeError < Youtube::Error
    end
  end
end
