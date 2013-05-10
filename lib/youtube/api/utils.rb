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

    end
  end
end
