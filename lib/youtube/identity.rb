require 'youtube/base'

module Youtube
  class Identity < Youtube::Base
    # Initializes a new object
    #
    # @param attrs [Hash]
    # @raise [ArgumentError] Error raised when supplied argument is missing an :id key.
    # @return [Youtube::Identity]
  private

    def statistics_count attribute
      if @attrs[:v3][:items][0][:statistics].nil?
        0
      else
        @attrs[:v3][:items][0][:statistics][attribute].to_i
      end
    end

  end
end
