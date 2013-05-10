module Youtube
  class Version
    MAJOR = 4 unless defined? Youtube::Version::MAJOR
    MINOR = 6 unless defined? Youtube::Version::MINOR
    PATCH = 2 unless defined? Youtube::Version::PATCH
    PRE = nil unless defined? Youtube::Version::PRE

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end

    end

  end
end
