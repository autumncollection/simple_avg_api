require 'spec_helper'
require 'simple_api'

RSpec.describe "init test" do
  it 'process_input' do
    response = SimpleApi.process_input
    expect(response.size).not_to be(0)
    counter = response.count { |c| c[:property_id] && c[:process_id] }
    expect(counter).to be(response.size)
  end

  it 'make urls' do
    response = SimpleApi.process_input
    urls     = SimpleApi.make_urls(response)
    expect(urls.size).not_to be(0)
    counter = response.count do |url|
      !url.match('#property_id#') && !url.match('#product_id#')
    end
    expect(counter).to be(urls.size)
  end
end
