require 'youtube/base'

module Youtube
  class Identity < Youtube::Base
    # Initializes a new object
    #
    # @param attrs [Hash]
    # @raise [ArgumentError] Error raised when supplied argument is missing an :id key.
    # @return [Youtube::Identity]
  private

    def v3_item_attrs
      @attrs[:v3][:items][0]
    end

    def statistics_count attribute
      if v3_item_attrs[:statistics].nil?
        0
      else
        v3_item_attrs[:statistics][attribute].to_i
      end
    end

  end
end
