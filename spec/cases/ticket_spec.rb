require 'spec_helper'

describe "EthorApi::Api::Ticket" do
  before(:each) do
    @service = EthorApi::Client.new :sandbox, 'wCwyp9usBtoKzWV0DRPznfieyR57OVSu', double
  end

  it "creates a ticket" do
    ticket = @service.ticket.create "HI6PIDO5JS", { body: {order_type: 'dine_in'}}
    expect(ticket).to be
    expect(ticket["ticket"]["order_type"]).to eq 'dine_in'
  end
end
