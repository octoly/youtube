module Youtube
  module API
    module Utils

    private

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param paths [Hash]
      # @param options [Hash]
      # @return [Object]
      def object_from_responses(klass, request_method, paths, options={})
        responses = Hash.new
        paths.each do |key, path|
          responses[key.to_sym] = send(request_method.to_sym, path, { endpoint: key })
        end
        klass.from_responses(responses)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def object_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path, options.merge(endpoint: :v3))
        klass.from_response(response)
      end

    end
  end
end
