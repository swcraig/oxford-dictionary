require 'oxford_dictionary/client'
require 'oxford_dictionary/endpoint/entry_endpoint'
require 'oxford_dictionary/version'
require 'oxford_dictionary/request'

# Adds some aliasing
module OxfordDictionary
  class << self
    # Alias for OxfordDictionary::Client.new
    def new(params)
      Client.new(params)
    end
  end
end