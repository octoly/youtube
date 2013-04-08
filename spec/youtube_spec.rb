require 'spec_helper'

describe Youtube do

  after do
    Youtube.reset!
  end

  describe ".client" do
    it "returns a Youtube::Client" do
      expect(Youtube.client).to be_a Youtube::Client
    end

    context "when the options don't change" do
      it "caches the client" do
        expect(Youtube.client).to eq Youtube.client
      end
    end
    context "when the options change" do
      it "busts the cache" do
        client1 = Youtube.client
        Youtube.configure do |config|
          config.consumer_key = 'abc'
          config.consumer_secret = '123'
        end
        client2 = Youtube.client
        expect(client1).not_to eq client2
      end
    end
  end

  describe ".configure" do
    Youtube::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        Youtube.configure do |config|
          config.send("#{key}=", key)
        end
        expect(Youtube.instance_variable_get(:"@#{key}")).to eq key
      end
    end
  end
end
