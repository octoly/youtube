require 'helper'

describe Youtube::API::Videos do

  before do
    @client = Youtube::Client.new(developer_key: ENV['YOUTUBE_DEVELOPER_KEY'])
  end

  describe '#list' do
    it "returns a Video" do
      video = @client.video(id: 'C0DPdy98e4c')
      expect(video).to be_a Youtube::Video
    end

    it 'returns an array' do
      @videos = @client.video(id: ['C0DPdy98e4c', 'bbEoRnaOIbs'])
      expect(@videos).to be_an Array
    end

    it 'returns an array of valid videos' do
      @videos = @client.video(id: ['C0DPdy98e4c', 'bbEoRnaOIbs'])
      expect(@videos.first.valid_item?).to be true
    end

    it 'returns an array which holds the same number as ids passed' do
      @videos = @client.video(id: ['C0DPdy98e4c', 'bbEoRnaOIbs'])
      expect(@videos.count == 2)
    end

    it 'returns an array which holds nil values' do
      @videos = @client.video(id: ['not-valid-id', 'another-not-valid-id'])
      expect(@videos.first).to be_nil
    end
  end

end
