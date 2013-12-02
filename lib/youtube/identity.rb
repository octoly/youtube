require 'youtube/base'

module Youtube
  class Identity < Youtube::Base
    # Initializes a new object
    #
    # @param attrs [Hash]
    # @raise [ArgumentError] Error raised when supplied argument is missing an :id key.
    # @return [Youtube::Identity]
  private

    def item_attrs
      @attrs[:items][0]
    end

    def statistics_count attribute
      if item_attrs[:statistics].nil?
        0
      else
        item_attrs[:statistics][attribute].to_i
      end
    end

  end
end
