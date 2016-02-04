require 'spec_helper'
require 'simple_api'

RSpec.describe "init test" do
  before :context do
    @simple_api = SimpleApi::Akamai.new
  end

  it 'process_input' do
    response = @simple_api.process_input
    expect(response.size).not_to be(0)
    counter = response.count { |c| c[:property_id] && c[:process_id] }
    expect(counter).to be(response.size)
  end

  it 'make urls' do
    response = @simple_api.process_input
    urls     = @simple_api.make_urls(response)
    expect(urls.size).not_to be(0)
    counter = response.count do |url|
      !url.match('#property_id#') && !url.match('#product_id#')
    end
    expect(counter).to be(urls.size)
  end
end
