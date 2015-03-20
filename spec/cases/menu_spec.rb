require 'spec_helper'

describe "EthorApi::Api::Ticket" do
  before(:each) do
    @store_id = "0TE00X5718"
    @menu_item_id = "O4D00LJTMK"
    @service = EthorApi::Client.new :sandbox, ENV['PS_ETHOR_API_KEY'], double
  end

  it "gets a menu item" do
    menu_item = @service.menu.find_menu_item @store_id, @menu_item_id
    expect(menu_item).to be
    expect(menu_item["menu_item"]["menu_item_id"]).to eq @menu_item_id
  end

  it "gets the menu" do
    menu_item = @service.menu.all @store_id
    expect(menu_item).to be
    expect(menu_item["menu"]).to be
  end

end
