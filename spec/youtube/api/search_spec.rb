require 'helper'

describe Youtube::API::Search do

  before do
    @client = Youtube::Client.new(developer_key: 'AIzaSyCIzbuKiXJp4RA9dLlWTarjcH-Eurgzq6U')
  end

  describe '#search' do

    context 'when search API with video type' do
      it 'returns Video IDs related to a query' do
        search = @client.search(type: 'video', q: 'rails')
        expect(search).to be_a Youtube::SearchResults
        expect(search.results).to be_an Array
        expect(search.results.first).to be_a String
      end

      it 'returns 50 Video IDs when maxResults=50' do
        search = @client.search(type: 'video', q: 'rails', maxResults: 50)
        expect(search.results.count == 50).to be_true
      end

      it 'returns Video IDs related to a query ordered by date' do
        search = @client.search(type: 'video', q: 'rails', order: 'date')
        expect(search).to be_a Youtube::SearchResults
        expect(search.results).to be_an Array
        expect(search.results.first).to be_a String
      end

      it 'returns nextPageToken as a String' do
        search = @client.search(type: 'video', q: 'rails')
        expect(search.next_page_token).to be_a String
      end

      it 'returns the last published_at' do
        search = @client.search(type: 'video', q: 'rails')
        expect(search.last_published_at).to be_a Time
      end

      it 'returns the total results' do
        search = @client.search(type: 'video', q: 'rails')
        expect(search.total_results).to be_an Integer
      end
    end

    context 'when search API with no results' do
      it 'returns an empty array' do
        search = @client.search(type: 'video', q: 'viklgrbwdvojklbfwd')
        expect(search.results).to be_an Array
      end

      it 'returns nil for last published_at' do
        search = @client.search(type: 'video', q: 'viklgrbwdvojklbfwd')
        expect(search.last_published_at).to be_nil
      end

      it 'returns the total results' do
        search = @client.search(type: 'video', q: 'viklgrbwdvojklbfwd')
        expect(search.total_results == 0).to be_true
      end
    end

  end

end
