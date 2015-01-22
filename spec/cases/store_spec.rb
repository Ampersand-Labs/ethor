require 'spec_helper'

describe "EthorApi::Api::Store" do
  before(:each) do
    @service = EthorApi::Client.new :sandbox, ENV['PS_ETHOR_API_KEY'], double
  end

  it "gets a list of stores" do
    expect(@service.store.all.length).to be(2)
  end
end