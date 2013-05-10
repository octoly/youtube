require 'helper'

describe Youtube::API::Videos do

  before do
    @client = Youtube::Client.new(developer_key: 'AIzaSyCIzbuKiXJp4RA9dLlWTarjcH-Eurgzq6U')
  end

  describe '#list' do
    it "returns a Video" do
      video = @client.video('ywBRKW93m0I')
      expect(video).to be_a Youtube::Video
    end
  end
end
