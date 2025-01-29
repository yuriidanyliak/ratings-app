# frozen_string_literal: true

# spec/api/movies_api_spec.rb
require 'rails_helper'

describe API::V1::Ratings, type: :request do
  let(:json_response) { JSON.parse(response.body) }

  let(:user) { create(:user) }
  let(:movie) { create(:movie) }

  describe 'POST /api/v1/ratings' do
    subject(:api_post) { post '/api/v1/ratings', params: params }

    context 'with valid parameters' do
      let(:params) do
        { user_id: user.id, movie_id: movie.id, score: 4, review: 'Sample Text' }
      end

      it 'creates a new rating' do
        expect { api_post }.to change(Rating, :count).by(1)
      end

      it 'returns HTTP created' do
        api_post
        expect(response).to have_http_status(:created)
      end

      it 'serializes created Rating' do
        api_post

        expect(json_response).to include('user_id' => user.id, 'movie_id' => movie.id, 'score' => 4)
      end
    end

    context 'when user_id is missing' do
      let(:params) do
        { movie_id: movie.id, score: 4, review: nil }
      end

      before { api_post }

      it 'returns Bad Request error' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns error message' do
        expect(json_response['error']).to eq('user_id is missing')
      end
    end

    context 'when score is invalid' do
      let(:params) do
        { user_id: user.id, movie_id: movie.id, score: 'invalid', review: 'Sample Text' }
      end

      before { api_post }

      it 'returns Bad Request error' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns error message' do
        expect(json_response['error']).to eq('score is invalid')
      end
    end
  end

  describe 'GET /api/v1/ratings' do
    subject(:api_get) { get '/api/v1/ratings', params: params }

    let(:rating1) { create(:rating, user: user, movie: movie, score: 5) }
    let(:rating2) { create(:rating, user: user, movie: movie, score: 3) }

    before do
      rating1
      rating2
    end

    context 'when no parameters are provided' do
      let(:params) { {} }

      it 'returns all ratings' do
        api_get
        expect(response).to have_http_status(:ok)
        expect(json_response.size).to eq(2)
      end

      it 'returns correctly serialized ratings' do
        api_get
        expect(json_response).to all(include('user_id', 'movie_title', 'movie_year', 'score'))
      end
    end

    context 'when filtering by movie_id' do
      let(:params) { { movie_id: movie.id } }

      it 'returns only ratings for the specified movie' do
        api_get
        expect(response).to have_http_status(:ok)
        expect(json_response).to all(include('movie_title' => movie.title))
      end
    end

    context 'when filtering by user_id' do
      let(:params) { { user_id: user.id } }

      it 'returns only ratings for the specified user' do
        api_get
        expect(response).to have_http_status(:ok)
        expect(json_response).to all(include('user_id' => user.id))
      end
    end

    context 'when filtering by an invalid movie_id' do
      let(:params) { { movie_id: 99_999 } }

      before { api_get }

      it 'returns an empty array' do
        expect(response).to have_http_status(:ok)
        expect(json_response).to eq([])
      end
    end

    context 'when filtering by an invalid user_id' do
      let(:params) { { user_id: 99_999 } }

      before { api_get }

      it 'returns an empty array' do
        expect(response).to have_http_status(:ok)
        expect(json_response).to eq([])
      end
    end
  end
end
