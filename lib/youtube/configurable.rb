require 'forwardable'

module Youtube
  module Configurable
    extend Forwardable
    attr_writer :developer_key
    def_delegator :options, :hash

    class << self

      def keys
        @keys ||= [
          :developer_key,
        ]
      end

    end

    def reset!
      Youtube::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Youtube::Default.options[key])
      end
      self
    end

  private

    # @return [Hash]
    def options
      Hash[Youtube::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  end
end
