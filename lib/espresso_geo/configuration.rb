# frozen_string_literal: true

require 'logger'

module EspressoGeo
  class Configuration
    attr_accessor :consumer_key, :consumer_secret, :base_url

    def initialize
      @consumer_key = nil
      @consumer_secret = nil
      @base_url = 'https://api.geopath.org/v2.1'
    end
  end
end
