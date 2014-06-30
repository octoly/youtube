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

    it 'returns an array' do
      @channels = @client.channel(id: ['UCMmADDDgI-dXaPGoIZ3qIsQ', 'UCVrPiUtl29kULN2HIAm244Q'])
      expect(@channels).to be_an Array
    end

    it 'returns an array of valid channels' do
      @channels = @client.channel(id: ['UCMmADDDgI-dXaPGoIZ3qIsQ', 'UCVrPiUtl29kULN2HIAm244Q'])
      expect(@channels.first.valid_item?).to be true
    end

    it 'returns an array which holds the same number as ids passed' do
      @channels = @client.channel(id: ['UCMmADDDgI-dXaPGoIZ3qIsQ', 'UCVrPiUtl29kULN2HIAm244Q'])
      expect(@channels.count == 2)
    end

    it 'returns an array which holds nil values' do
      @channels = @client.channel(id: ['not-valid-id', 'another-not-valid-id'])
      expect(@channels.first).to be_nil
    end
  end

end
