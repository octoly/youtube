require 'helper'

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
          config.developer_key = 'abc'
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

    context "when no credentials are provided" do
      it "does not raise an exception" do
        expect {
          Youtube.configure do |config|
            config.developer_key = nil
          end
        }.to_not raise_exception
      end
    end
  end
end
