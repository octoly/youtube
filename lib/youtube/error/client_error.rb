require 'youtube/error'

module Youtube
  class Error
    # Raised when Youtube returns a 4xx HTTP status code or there's an error in Faraday
    class ClientError < Youtube::Error
    end
  end
end
