require 'faraday'
require 'multi_json'
require 'multi_xml'

module Youtube
  module Response
    class Parse < Faraday::Response::Middleware

      def parse(body)
        case body
        when /^s*<[^hh>]/
          MultiXml.parser = :nokogiri
          MultiXml.parse(body)
        else
          MultiJson.decode(body, :symbolize_keys => true)
        end
      end

      def on_complete(env)
        if respond_to?(:parse)
          env[:body] = parse(env[:body]) unless [204, 301, 302, 304].include?(env[:status])
        end
      end

    end
  end
end
