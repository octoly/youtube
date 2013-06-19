require 'helper'

describe Youtube::Channel do

  before do
    @client = Youtube::Client.new(developer_key: 'AIzaSyCIzbuKiXJp4RA9dLlWTarjcH-Eurgzq6U')
    @channel = @client.channel('UCMmADDDgI-dXaPGoIZ3qIsQ')
  end

  describe 'channel' do
    it 'returns nil' do
      @channel = @client.channel('not-valid-id')
      expect(@channel).to be_nil
    end
  end

  describe '#exists?' do
    it 'returns true' do
      expect(@channel.exists?).to be_true
    end
  end

  describe '#id' do
    it 'returns a String' do
      expect(@channel.id).to be_a String
    end
    it 'returns UCMmADDDgI-dXaPGoIZ3qIsQ' do
      expect(@channel.id == 'UCMmADDDgI-dXaPGoIZ3qIsQ').to be_true
    end
  end

  describe '#title' do
    it 'returns a String' do
      expect(@channel.title).to be_a String
    end
    it "returns 'Channel Demo!'" do
      expect(@channel.title == 'Channel Demo!').to be_true
    end
  end

  describe '#description' do
    it 'returns a String' do
      expect(@channel.description).to be_a String
    end
    it "returns 'This channel is a demo for brand channels.'" do
      expect(@channel.description == 'This channel is a demo for brand channels.').to be_true
    end
  end

  describe '#published_at' do
    it 'returns a Time' do
      expect(@channel.published_at).to be_a Time
    end
  end

  describe '#thumbnails' do
    before do
      @channel = @client.channel('UCLCmJiSbIoa_ZFiBOBDf6ZA')
    end
    it 'returns a Hash' do
      expect(@channel.thumbnails).to be_a Hash
    end
  end

  describe '#views_count' do
    it 'returns an Integer' do
      expect(@channel.views_count).to be_a Integer
    end
  end

  describe '#videos_count' do
    it 'returns an Integer' do
      expect(@channel.videos_count).to be_a Integer
    end
  end

  describe '#subscribers_count' do
    it 'returns an Integer' do
      expect(@channel.subscribers_count).to be_a Integer
    end
  end

  describe '#comments_count' do
    it 'returns an Integer' do
      expect(@channel.comments_count).to be_a Integer
    end
  end

  describe '#topic_ids' do
    it 'returns an Array' do
      expect(@channel.topic_ids).to be_a Array
    end
  end

  describe '#keywords' do
    before do
      @channel = @client.channel('UCLCmJiSbIoa_ZFiBOBDf6ZA')
    end
    it 'returns a String' do
      expect(@channel.keywords).to be_a String
    end
  end

  describe '#featured_channels_urls' do
    it 'returns an Aray' do
      expect(@channel.featured_channels_urls).to be_a Array
    end
  end

end