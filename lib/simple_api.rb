require 'simple_api/version'
require 'open-uri'
require 'hashie'

module SimpleApi
  URLS = {
    json: 'https://panvicky.wcli.cz/json_file',
    akab: 'https://akab-hah2jau56cy5pxmr-nrl6xaj4h5u4rnts.luna.akamaiapis.net' \
    '/papi/v0/properties/#property_id#/versions/#product_id#' \
    '/hostnames/?contractId=ctr_3-4KI07O&groupId=grp_21471' }.freeze

  class Akamai
    attr_reader :processed_input
    def initialize
      @processed_input = []
    end

    # open-uri request
    def download_file
    end

    # [{product_id: '', property_id: ''}, {product_id: '', property_id: ''}]
    def process_input
      @processed_input = []
    end

    # ['URL WITH IDS', 'URL WITH IDS']
    def make_urls(ids)
    end
  end
end
