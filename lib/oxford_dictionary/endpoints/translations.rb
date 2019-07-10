require 'oxford_dictionary/endpoints/endpoint'

module OxfordDictionary
  module Endpoints
    # Interface for the /translations endpoint
    #
    # API documentation can be found here:
    # https://developer.oxforddictionaries.com/documentation
    class Translations < Endpoint
      ENDPOINT = 'translations'.freeze

      def translation(word:, source_language:, target_language:, params: {})
        path = "#{ENDPOINT}/#{source_language}/#{target_language}/#{word}"
        uri = request_uri(path: path, params: params)

        response = @request_client.get(uri: uri)
        deserialize.call(response.body)
      end
    end
  end
end
