require 'helper'

describe Youtube::API::Channels do

  before do
    @client = Youtube::Client.new(developer_key: 'AIzaSyCIzbuKiXJp4RA9dLlWTarjcH-Eurgzq6U')
  end

  describe '#list' do
    it "returns a Channel" do
      channel = @client.channel(id: 'UCMmADDDgI-dXaPGoIZ3qIsQ')
      expect(channel).to be_a Youtube::Channel
    end

    it "returns a Channel with forUsername" do
      channel = @client.channel(forUsername: 'brandedchanneldemo')
      expect(channel).to be_a Youtube::Channel
    end
  end
end
