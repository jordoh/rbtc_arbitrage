require 'spec_helper'

describe RbtcArbitrage::Clients::CaVirtexClient do
  let(:client) { RbtcArbitrage::Clients::CaVirtexClient.new }
  before(:each) { client.validate_env }

  it { client.exchange.should == :cavirtex }

  describe "#price" do
    [:buy, :sell].each do |action|
      it "fetches price for #{action} correctly", :vcr do
        client.price(action).should be_a(Float)
      end
    end

    #it "calls cavirtex", :vcr do
    #  client.price(:buy).should == coinbase.buy_price.to_f
    #  client.instance_variable_set :@price, nil
    #  client.price(:sell).should == coinbase.sell_price.to_f
    #end
  end

end