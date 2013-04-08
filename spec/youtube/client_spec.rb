require 'spec_helper'

describe Youtube::Client do

  subject do
    Youtube::Client.new(developer_key: "DK")
  end

  context "with module configuration" do

    before do
      Youtube.configure do |config|
        Youtube::Configurable.keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Youtube.reset!
    end

    it "inherits the module configuration" do
      client = Youtube::Client.new
      Youtube::Configurable.keys.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq key
      end
    end

    context "with class configuration" do

      before do
        @configuration = {
          developer_key: 'CK',
          identity_map: ::Hash,
        }
      end

      context "during initialization" do
        it "overrides the module configuration" do
          client = Youtube::Client.new(@configuration)
          Youtube::Configurable.keys.each do |key|
            expect(client.instance_variable_get(:"@#{key}")).to eq @configuration[key]
          end
        end
      end

      context "after initialization" do
        it "overrides the module configuration after initialization" do
          client = Youtube::Client.new
          client.configure do |config|
            @configuration.each do |key, value|
              config.send("#{key}=", value)
            end
          end
          Youtube::Configurable.keys.each do |key|
            expect(client.instance_variable_get(:"@#{key}")).to eq @configuration[key]
          end
        end
      end
    end
  end
end
