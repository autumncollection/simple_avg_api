require 'simple_api/version'
require 'open-uri'
require 'hashie'
require 'json'

module SimpleApi
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  URLS = {
    json: 'https://panvicky.wcli.cz/json_file',
    akab: 'https://akab-hah2jau56cy5pxmr-nrl6xaj4h5u4rnts.luna.akamaiapis.net' \
    '/papi/v0/properties/#property_id#/versions/#product_version#' \
    '/hostnames/?contractId=ctr_3-4KI07O&groupId=grp_21471' }.freeze

  class Akamai
    attr_reader :processed_input
    def initialize
      @processed_input = []
    end

    # open-uri request
    def download_file
      open(URLS[:json]).read
    end

    def process_input
      downloaded_json = Hashie::Mash.new(
        JSON.parse(download_file))
      @processed_input = downloaded_json.properties.items.map do |item|
        next if !item.propertyId || !item.productionVersion
        { property_id: item.propertyId, production_version: item.productionVersion }
      end
      @processed_input.compact!
      @processed_input
    end

    # ['URL WITH IDS', 'URL WITH IDS']
    def make_urls(pretty_hash)
      pretty_hash.map do |hash|
        URLS[:akab].sub('#property_id#', hash[:property_id].to_s) \
         .sub('#product_version#', hash[:production_version].to_s)
      end
    end
  end
end
