# frozen_string_literal: true

# spec/api/movies_api_spec.rb
require 'rails_helper'

describe API::V1::Movies, type: :request do
  let!(:movie) { create(:movie) }
  let(:json_response) { JSON.parse(response.body) }

  describe 'GET /api/movies' do
    it 'returns a list of movies' do
      get '/api/v1/movies'

      expect(response).to have_http_status(:ok)
      expect(json_response.length).to eq(1)
      expect(json_response[0]).to include('title', 'year', 'genre')
    end
  end

  describe 'GET /api/movies/:id' do
    it 'returns a specific movie' do
      get "/api/v1/movies/#{movie.id}"

      expect(response).to have_http_status(:ok)
      expect(json_response['id']).to eq(movie.id)
    end

    context 'when movie does not exist' do
      it 'raises record not found error' do
        expect { get '/api/v1/movies/999' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
