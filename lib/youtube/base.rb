module Youtube
  class Base

    # return [Youtube::IdentityMap]
    def self.identity_map
      return unless Youtube.identity_map
      @identity_map = Youtube.identity_map.new unless defined?(@identity_map) && @identity_map.class == Youtube.identity_map
      @identity_map
    end

    # Returns a new object based on the response hash
    #
    # @param response [Hash]
    # @return [Youtube::Base]
    def self.from_response(response={})
      fetch_or_new(response[:body])
    end

    # Retrieves an object from the identity map, or stores it in the
    # identity map if it doesn't already exist.
    #
    # @param attrs [Hash]
    # @return [Youtube::Base]
    def self.fetch_or_new(attrs={})
      return unless attrs
      return new(attrs) unless identity_map

      fetch(attrs) do
        object = new(attrs)
        store(object)
      end
    end

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @return [Youtube::Base]
    def initialize(attrs={})
      @attrs = attrs
    end

  end
end
