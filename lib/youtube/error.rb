module Youtube
  # Custom error class for rescuing from all Youtube errors
  class Error < StandardError
    attr_reader :rate_limit
  end
end
