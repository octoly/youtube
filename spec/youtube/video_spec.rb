require 'helper'

describe Youtube::Video do

  before do
    @client = Youtube::Client.new(developer_key: 'AIzaSyCIzbuKiXJp4RA9dLlWTarjcH-Eurgzq6U')
    @video = @client.video('AVjvsgcBKrs')
  end

  describe '#id' do
    it 'returns a String' do
      expect(@video.id).to be_a String
    end
    it 'returns AVjvsgcBKrs' do
      expect(@video.id == 'AVjvsgcBKrs').to be_true
    end
  end

  describe '#channel_id' do
    it 'returns a String' do
      expect(@video.channel_id).to be_a String
    end
    it 'returns UCN-k-F0ZW5ScVeHUriZ7HEA' do
      expect(@video.channel_id == 'UCN-k-F0ZW5ScVeHUriZ7HEA').to be_true
    end
  end

  describe '#title' do
    it 'returns a String' do
      expect(@video.title).to be_a String
    end
    it "returns 'This is the title of Youtube Video'" do
      expect(@video.title == 'This is the title of Youtube Video').to be_true
    end
  end

  describe '#description' do
    it 'returns a String' do
      expect(@video.description).to be_a String
    end
    it "returns 'This is the description of Youtube Video'" do
      expect(@video.description == 'This is the description of Youtube Video').to be_true
    end
  end

  describe '#published_at' do
    it 'returns a Time' do
      expect(@video.published_at).to be_a Time
    end
  end

  describe '#updated_at' do
    it 'returns a Time' do
      expect(@video.updated_at).to be_a Time
    end
  end

  describe '#category_id' do
    it 'returns a Integer' do
      expect(@video.category_id).to be_a Integer
    end
    it 'returns 27 (Education)' do
      expect(@video.category_id == 27).to be_true
    end
  end

  describe '#views_count' do
    it 'returns a Integer' do
      expect(@video.views_count).to be_a Integer
    end
  end

  describe '#likes_count' do
    it 'returns a Integer' do
      expect(@video.likes_count).to be_a Integer
    end
  end

  describe '#dislikes_count' do
    it 'returns a Integer' do
      expect(@video.dislikes_count).to be_a Integer
    end
  end

  describe '#favorites_count' do
    it 'returns a Integer' do
      expect(@video.favorites_count).to be_a Integer
    end
  end

  describe '#comments_count' do
    it 'returns a Integer' do
      expect(@video.comments_count).to be_a Integer
    end
  end

  describe '#upload_status' do
    it 'returns a String' do
      expect(@video.upload_status).to be_a String
    end
  end

  describe '#privacy_status' do
    it 'returns a String' do
      expect(@video.privacy_status).to be_a String
    end
  end

  describe '#topic_ids' do
    it 'returns a String' do
      expect(@video.topic_ids).to be_a Array
    end
  end
end
