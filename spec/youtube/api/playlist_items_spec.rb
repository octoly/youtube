require 'helper'

describe Youtube::API::PlaylistItems do

  before do
    @client = Youtube::Client.new(developer_key: 'AIzaSyCIzbuKiXJp4RA9dLlWTarjcH-Eurgzq6U')
  end

  describe '#list' do
    it "returns a PlaylistItems by id" do
      playlist_items = @client.playlist_items(id: 'UUXo0KJ3CT-E2avjl5c7rmf3A7FDeMXlIV')
      expect(playlist_items).to be_a Youtube::PlaylistItems
    end

    it "next_page_token returns nil when passing an id" do
      playlist_items = @client.playlist_items(id: 'UUXo0KJ3CT-E2avjl5c7rmf3A7FDeMXlIV')
      expect(playlist_items.next_page_token).to be_nil
    end

    it "video_ids returns an array of one string when passing an id" do
      playlist_items = @client.playlist_items(id: 'UUXo0KJ3CT-E2avjl5c7rmf3A7FDeMXlIV')
      expect(playlist_items.video_ids.count == 1).to be_true
    end

    it "returns PlaylistItems for playlistId" do
      playlist_items = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g')
      expect(playlist_items).to be_a Youtube::PlaylistItems
    end

    it "video_ids returns an array of two string when passing a playlistId and maxResults 2" do
      playlist_items = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g', maxResults: 2)
      expect(playlist_items.video_ids.count == 2).to be_true
    end

    it "next_page_token returns a string when passing a playlistId and maxResults 2" do
      playlist_items = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g', maxResults: 2)
      expect(playlist_items.next_page_token).to be_a String
    end

    it "video_ids returns an array of two string when passing a playlistId and maxResults 2 with next_page_token" do
      playlist_items = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g', maxResults: 2)
      playlist_items_page_2 = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g', maxResults: 2, nextPageToken: playlist_items.next_page_token)
      expect(playlist_items_page_2.video_ids.count == 2).to be_true
    end

    it "video_ids returns an array of string" do
      playlist_items = @client.playlist_items(id: 'UUXo0KJ3CT-E2avjl5c7rmf3A7FDeMXlIV')
      expect(playlist_items.video_ids).to be_an Array
    end

    it 'video_ids returns empty array if bad id passed' do
      playlist_items = @client.playlist_items(id: 'not-valid-id')
      expect(playlist_items.video_ids).to be_empty
    end
  end

end
