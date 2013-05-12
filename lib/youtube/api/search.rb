require 'youtube/api/utils'
require 'youtube/search_results'

module Youtube
  module API
    module Search
      include Youtube::API::Utils

      def search(options={})
        object_from_response(
          Youtube::SearchResults,
          :get,
          "/youtube/v3/search?part=id",
          options
        )
      end
    end
  end
end
