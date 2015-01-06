module Youtube
  class Base

    # Returns a new object based on the response hash
    #
    # @param response [Hash]
    # @return [Youtube::Base]
    def self.from_response(response={})
      return unless response[:body]
      raise Youtube::Error::ServerError.from_response(response) unless valid_response?(response[:body])
      object = new(response[:body][:items][0])
      object.exists? ? object : nil
    end

    # Returns an array of new object based on the response hash
    #
    # @param response [Hash]
    # @return [Youtube::Base]
    def self.array_from_response(response={})
      return [] unless response[:body]
      raise Youtube::Error::ServerError.from_response(response) unless valid_response?(response[:body])
      objects = []
      response[:body][:items].each do |item|
        object = new(item)
        objects << (object.exists? ? object : nil)
      end
      objects
    end

    # Initializes a new object
    #
    # @param response[:body] [Hash]
    # @return [Youtube::Base]
    def initialize(attrs={})
      @attrs = attrs
    end

  end
end
