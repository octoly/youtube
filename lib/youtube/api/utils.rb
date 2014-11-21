module Youtube
  module API
    module Utils

    private

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def object_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path, options.merge(endpoint: :v3))
        klass.from_response(response)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def objects_from_response(klass, request_method, path, options={})
        options[:id] = options[:id].join(',') if options[:id].is_a?(Array)
        response = send(request_method.to_sym, path, options.merge(endpoint: :v3))
        klass.array_from_response(response)
      end

    end
  end
end
