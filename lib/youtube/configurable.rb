require 'forwardable'
require 'youtube/error/configuration_error'

module Youtube
  module Configurable
    extend Forwardable
    attr_writer :developer_key
    attr_accessor :endpoint_options
    attr_accessor :connection_options
    attr_accessor :middleware
    attr_accessor :proxy
    def_delegator :options, :hash

    class << self

      def keys
        @keys ||= [
          :developer_key,
          :endpoint_options,
          :connection_options,
          :proxy,
          :middleware,
        ]
      end

    end

    def configure
      yield self
      validate_credential_type!
      self
    end

    def reset!
      Youtube::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Youtube::Default.options[key])
      end
      self
    end
    alias setup reset!

  private

    def credentials
      {
        developer_key: @developer_key
      }
    end

    # @return [Hash]
    def options
      Hash[Youtube::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

    def validate_credential_type!
      credentials.each do |credential, value|
        next if value.nil?

        unless value.is_a?(String) || value.is_a?(Symbol)
          raise(Error::ConfigurationError, "Invalid #{credential} specified: #{value} must be a string or symbol.")
        end
      end
    end
  end
end
