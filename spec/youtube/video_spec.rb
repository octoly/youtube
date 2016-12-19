require 'helper'

describe Youtube::Video do

  before do
    @client = Youtube::Client.new(developer_key: 'AIzaSyCIzbuKiXJp4RA9dLlWTarjcH-Eurgzq6U')
    @video = @client.video(id: 'C0DPdy98e4c')
  end

  describe 'video response' do
    it 'returns true' do
      @video = @client.video(id: 'C0DPdy98e4c')
      expect(@video.valid_item?).to be true
    end
  end

  describe 'video' do
    it 'returns nil' do
      @video = @client.video(id: 'not-valid-id')
      expect(@video).to be_nil
    end
  end

  describe '#exists?' do
    it 'returns true' do
      expect(@video.exists?).to be true
    end
  end

  describe '#id' do
    it 'returns a String' do
      expect(@video.id).to be_a String
    end
    it 'returns C0DPdy98e4c' do
      expect(@video.id == 'C0DPdy98e4c').to be true
    end
  end

  describe '#channel_id' do
    it 'returns a String' do
      expect(@video.channel_id).to be_a String
    end
    it 'returns UCHDm-DKoMyJxKVgwGmuTaQA' do
      expect(@video.channel_id == 'UCHDm-DKoMyJxKVgwGmuTaQA').to be true
    end
  end

  describe '#title' do
    it 'returns a String' do
      expect(@video.title).to be_a String
    end
    it "returns 'TEST VIDEO'" do
      expect(@video.title == 'TEST VIDEO').to be true
    end
  end

  describe '#description' do
    it 'returns a String' do
      expect(@video.description).to be_a String
    end
    it "returns 'COUNTING LEADER AND TONE'" do
      expect(@video.description == 'COUNTING LEADER AND TONE').to be true
    end
  end

  describe '#published_at' do
    it 'returns a Time' do
      expect(@video.published_at).to be_a Time
    end
  end

  describe '#thumbnails' do
    it 'returns a Hash' do
      expect(@video.thumbnails).to be_a Hash
    end
  end

  describe '#category_id' do
    it 'returns an Integer' do
      expect(@video.category_id).to be_a Integer
    end
    it 'returns 1 (Film & animation)' do
      expect(@video.category_id).to equal 1
    end
  end

  describe '#views_count' do
    it 'returns an Integer' do
      expect(@video.views_count).to be_a Integer
    end
  end

  describe '#likes_count' do
    it 'returns an Integer' do
      expect(@video.likes_count).to be_a Integer
    end
  end

  describe '#dislikes_count' do
    it 'returns an Integer' do
      expect(@video.dislikes_count).to be_a Integer
    end
  end

  describe '#favorites_count' do
    it 'returns an Integer' do
      expect(@video.favorites_count).to be_a Integer
    end
  end

  describe '#comments_count' do
    it 'returns an Integer' do
      expect(@video.comments_count).to be_a Integer
    end
  end

  describe '#topic_ids' do
    it 'returns an Array' do
      expect(@video.topic_ids).to be_a Array
    end
  end

  describe '#duration' do
    it 'return an Integer' do
      expect(@video.duration).to be_a Integer
    end
  end

  describe '#relevant_topic_ids' do
    it 'return an array' do
      expect(@video.relevant_topic_ids).to be_an Array
    end
  end

  describe '#region_restriction' do
    it 'return an array' do
      expect(@video.region_restriction).to be_a Hash
    end
  end

  describe '#live_streaming_details' do
    it 'return nil' do
      expect(@video.live_streaming_details).to be_nil
    end
  end

  describe '#live?' do
    it 'return false' do
      expect(@video.live?).to be false
    end
  end

  describe '#live_streaming_details present' do
    it 'return an array' do
      @video = @client.video(id: 'DIRfRPTGBgE')
      expect(@video.live_streaming_details).to be_a Hash
    end
  end

  describe '#privacy_status present' do
    it 'return a string' do
      @video = @client.video(id: 'DIRfRPTGBgE')
      expect(@video.privacy_status).to be_a String
    end
  end

  describe '#privacy_status present' do
    it 'return a string' do
      @video = @client.video(id: 'DIRfRPTGBgE')
      expect(@video.privacy_status).to be_a String
    end
  end

  describe '#upload_status present' do
    it 'return a string' do
      @video = @client.video(id: 'L6SQbVjpAbY')
      expect(@video.upload_status).to be_a String
    end
  end

  describe '#rejected? present' do
    it 'return a boolean' do
      @video = @client.video(id: 'L6SQbVjpAbY')
      expect(@video.rejected?).to be_in [true, false]
    end
  end

  describe '#rejection_reason present' do
    it 'return a string' do
      @video = @client.video(id: 'L6SQbVjpAbY')
      expect(@video.rejection_reason).to be_a String
    end
  end

  describe '#license present' do
    it 'return a string' do
      @video = @client.video(id: 'DIRfRPTGBgE')
      expect(@video.license).to be_a String
    end
  end

  describe '#privacy_status present' do
    it 'return a string' do
      @video = @client.video(id: 'DIRfRPTGBgE')
      expect(@video.privacy_status).to be_a String
    end
  end

  describe '#live? present' do
    it 'return true' do
      @video = @client.video(id: 'DIRfRPTGBgE')
      expect(@video.live?).to be true
    end
  end

end
