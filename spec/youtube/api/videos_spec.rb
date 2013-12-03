require 'helper'

describe Youtube::API::Videos do

  before do
    @client = Youtube::Client.new(developer_key: 'AIzaSyCIzbuKiXJp4RA9dLlWTarjcH-Eurgzq6U')
  end

  describe '#list' do
    it "returns a Video" do
      video = @client.video(id: 'AVjvsgcBKrs')
      expect(video).to be_a Youtube::Video
    end

    it 'returns an array' do
      @videos = @client.video(id: ['AVjvsgcBKrs', 'bbEoRnaOIbs'])
      expect(@videos).to be_an Array
    end

    it 'returns an array of valid videos' do
      @videos = @client.video(id: ['AVjvsgcBKrs', 'bbEoRnaOIbs'])
      expect(@videos.first.valid_item?).to be_true
    end

    it 'returns an array which holds the same number as ids passed' do
      @videos = @client.video(id: ['AVjvsgcBKrs', 'bbEoRnaOIbs'])
      expect(@videos.count == 2)
    end

    it 'returns an array which holds nil values' do
      @videos = @client.video(id: ['not-valid-id', 'another-not-valid-id'])
      expect(@videos.first).to be_nil
    end
  end

end
