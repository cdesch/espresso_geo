require 'logger'
require 'httparty'
require 'json'


class EspressoGeo::Client
  include HTTParty
  base_uri 'https://api.geopath.org/v2.1'
  #debug_output

  def initialize(consumer_key, consumer_secret)
    @consumer_key = consumer_key
    @consumer_secret = consumer_secret
    @auth = { "Geopath-API-Key": @consumer_key}
    @auth2 = {
        "Geopath-API-Key": @consumer_key,
        "Content-Type": 'application/json',
        'Content-Length': '1685'
    }
    @options = {
        headers: { "Geopath-API-Key": @consumer_key}
    }
  end

  #self.class.get("/statuses/#{which}_timeline.json", options)
  def media_types
    #options.merge!({ basic_auth: @auth })
    self.class.get("/inventory/media_types", @options)
  end

  def illumination_types
    self.class.get("/inventory/illumination_types", @options)
  end

  def classification_types
    self.class.get("/inventory/classification_types", @options)
  end

  def network_types
    self.class.get("/inventory/network_types", @options)
  end

  # params name id
  def constructions_search(params = {})
    options = @options
    options[:query] = params
    self.class.get("/inventory/constructions", @options)
  end

  def construction_types
    self.class.get("/inventory/construction_types", @options)
  end

  def placement_types
    self.class.get("/inventory/placement_types", @options)
  end

  def place_types
    self.class.get("/inventory/place_types", @options)
  end

  def representation_types
    self.class.get("/inventory/representation_types", @options)
  end

  def status_types
    self.class.get("/inventory/status_types", @options)
  end

  #https://api.geopath.org/v2.1/markets/search?type=DMA&page=1&pageSize=100
  # markets_search(params: {type: "DMA", q: "Atlanta"})
  def markets_search(params = {}, opts = { page: 1, page_size: 100})
    options = @options
    options[:query] = params.merge(opts)
    self.class.get("/markets/search", options)
  end

  #/v2.1/markets/ZIP30678
  def market(id)
    self.class.get("/markets/#{id}", @options)
  end

  # def panels(params = {}, opts = { full: true, page: 1, page_length: 100})
  #   options = @options
  #   options[:query] = params.merge(opts)
  #   self.class.get('/panels', @options)
  # end

  # /v2.1/segments/catalog?page=2&page_size=100
  def segment_catalog(params = {}, opts = { page: 1, page_size: 100})
    options = @options
    options[:query] = params.merge(opts)
    self.class.get('/segments/catalog', options)
  end

  # TODO: Pass ID list
  # {
  #     "id_list": [
  #         ""
  #     ]
  # }
  def segment_search(params = {}, opts = { page: 1, page_size: 100})
    options = @options
    options[:query] = params.merge(opts)
    self.class.get('/segments/search', options)
  end

  def segment(id)
    self.class.get("/segments/#{id}", @options)
  end

  def operators

  end

  # inventory
  # /inventory/search
  def inventory_search(params = {}, opts = { page: 1, page_size: 1000})
    options = { body: params.merge(opts).to_json, headers: @auth2}
    self.class.post('/inventory/search', options)
  end

  # /inventory/search/summary
  def inventory_search_summary(params = {}, opts = { page: 1, page_size: 1000})
    options = { body: params.merge(opts).to_json, headers: @auth2}
    self.class.post('/inventory/search/summary', options)
  end

  #geo_path_api.frame(30832275)
  def frame(id)
    self.class.get("/inventory/#{id}", @options)
  end

  def spot(id, params = {})
    options = @options
    options[:query] = params
    self.class.get("/inventory/spot/#{id}", options)
  end
end