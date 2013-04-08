require 'youtube/configurable'
require 'youtube/error/client_error'

module Youtube
  class Client
    include Youtube::Configurable

    def initialize(options={})
      Youtube::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Youtube.instance_variable_get(:"@#{key}"))
      end
    end
  end
end
