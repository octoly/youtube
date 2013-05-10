require 'faraday'
require 'multi_xml'

module Youtube
  module Response
    class ParseXml < Faraday::Response::Middleware

      def parse(body)
        case body
        when /^s*<[^Hh>]*html/
          MultiXml.parser = :nokogiri
          MultiXml.parse(body)
        else
          nil
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
