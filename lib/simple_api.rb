require 'simple_api/version'
require 'open-uri'
require 'oj'
require 'hashie'

module SimpleApi
  URL = 'https://drive.google.com/file' \
    '/d/0B6FFQFMX0DuSei1mcl8tUlNDN28/view?usp=sharing'.freeze

  URL_AKAB = 'https://akab-hah2jau56cy5pxmr-nrl6xaj4h5u4rnts.luna.akamaiapis.net' \
    '/papi/v0/properties/#property_id#/versions/#product_id#' \
    '/hostnames/?contractId=ctr_3-4KI07O&groupId=grp_21471'

  class << self
    # open-uri request
    def download_file
    end

    # [{product_id: '', property_id: ''}, {product_id: '', property_id: ''}]
    def process_input
      []
    end

    # ['URL WITH IDS', 'URL WITH IDS']
    def make_urls(ids)
    end
  end
end
