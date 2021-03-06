module Youtube
  # Custom error class for rescuing from all Youtube errors
  class Error < StandardError

    # @return [Hash]
    def self.errors
      @errors ||= {}
    end

    # Initializes a new Error object
    #
    # @param exception [Exception, String]
    # @param response_headers [Hash]
    # @return [Youtube::Error]
    def initialize(exception=$!, response_headers={})
      @wrapped_exception = exception
      exception.respond_to?(:backtrace) ? super(exception.message) : super(exception.to_s)
    end

    def backtrace
      @wrapped_exception.respond_to?(:backtrace) ? @wrapped_exception.backtrace : super
    end
  end
end
