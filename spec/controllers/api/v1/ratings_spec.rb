# spec/api/movies_api_spec.rb
require 'rails_helper'

describe API::V1::Ratings, type: :request do
  let(:json_response) { JSON.parse(response.body) }

  describe 'POST /api/v1/ratings' do
    subject(:api_post) { post '/api/v1/ratings', params: params }

    let(:user) { FactoryBot.create(:user) }
    let(:movie) { FactoryBot.create(:movie) }

    context 'with valid parameters' do
      let(:params) do
        { user_id: user.id, movie_id: movie.id, score: 4, review: "Sample Text" }
      end

      it 'creates a new rating' do
        expect { api_post }.to change { Rating.count }.by(1)
      end

      it 'returns HTTP created' do
        api_post
        expect(response.status).to eq(201)
      end
      
      it 'serializes created Rating' do
        api_post

        expect(json_response['user_id']).to eq(user.id)
        expect(json_response['movie_id']).to eq(movie.id)
        expect(json_response['score']).to eq(4)
      end
    end

    context "when user_id is missing" do
      let(:params) do
        { movie_id: movie.id, score: 4, review: nil }
      end

      it 'returns Bad Request error with message' do
        api_post

        expect(response.status).to eq(400)
        expect(json_response['error']).to eq('user_id is missing')
      end
    end

    context "when score is invalid" do
      let(:params) do
        { user_id: user.id, movie_id: movie.id, score: 'invalid', review: "Sample Text" }
      end

      it 'returns Bad Request error with message' do
        api_post

        expect(response.status).to eq(400)
        expect(json_response['error']).to eq('score is invalid')
      end
    end
  end
end
