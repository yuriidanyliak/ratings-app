# frozen_string_literal: true

# spec/api/movies_api_spec.rb
require 'rails_helper'

describe API::V1::Movies, type: :request do
  let!(:movie) { create(:movie) }
  let(:json_response) { JSON.parse(response.body) }

  describe 'GET /api/movies' do
    before { get '/api/v1/movies' }

    it 'returns successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a list containing one existing movie' do
      expect(json_response.first).to eq(json_response.last).and include('title', 'year', 'genre', 'rating_score')
    end
  end

  describe 'GET /api/movies/:id' do
    context 'with existing movie' do
      before { get "/api/v1/movies/#{movie.id}" }

      it 'returns successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a specific movie' do
        expect(json_response['id']).to eq(movie.id)
      end
    end

    context 'when movie does not exist' do
      it 'raises record not found error' do
        expect { get '/api/v1/movies/999' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
