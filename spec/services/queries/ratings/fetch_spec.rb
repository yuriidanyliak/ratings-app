# frozen_string_literal: true

require 'rails_helper'

describe Queries::Ratings::Fetch do
  subject(:fetch_service) { described_class.new(params).call }

  let(:movie1) { create(:movie, title: 'Inception') }
  let(:movie2) { create(:movie, title: 'Interstellar') }
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:rating1) { create(:rating, user: user1, movie: movie1, score: 5, created_at: 3.days.ago) }
  let(:rating2) { create(:rating, user: user1, movie: movie2, score: 3, created_at: 2.days.ago) }
  let(:rating3) { create(:rating, user: user2, movie: movie1, score: 4, created_at: 1.day.ago) }

  before do
    rating1
    rating2
    rating3
  end

  describe '#call' do
    context 'when no filters are provided' do
      let(:params) { {} }

      it 'returns all ratings' do
        expect(fetch_service).to contain_exactly(rating1, rating2, rating3)
      end
    end

    context 'when filtering by movie_id' do
      let(:params) { { movie_id: movie1.id } }

      it 'returns only ratings for the specified movie' do
        expect(fetch_service).to contain_exactly(rating1, rating3)
      end
    end

    context 'when filtering by user_id' do
      let(:params) { { user_id: user1.id } }

      it 'returns only ratings by the specified user' do
        expect(fetch_service).to contain_exactly(rating1, rating2)
      end
    end

    context 'when filtering by both movie_id and user_id' do
      let(:params) { { movie_id: movie1.id, user_id: user1.id } }

      it 'returns only matching ratings' do
        expect(fetch_service).to contain_exactly(rating1)
      end
    end

    context 'when sorting by newest' do
      let(:params) { { sort_by: 'newest' } }

      it 'returns ratings sorted by newest first' do
        expect(fetch_service).to eq([rating3, rating2, rating1])
      end
    end

    context 'when sorting by oldest' do
      let(:params) { { sort_by: 'oldest' } }

      it 'returns ratings sorted by oldest first' do
        expect(fetch_service).to eq([rating1, rating2, rating3])
      end
    end

    context 'when sorting by highest score' do
      let(:params) { { sort_by: 'highest_score' } }

      it 'returns ratings sorted by highest score first' do
        expect(fetch_service).to eq([rating1, rating3, rating2])
      end
    end

    context 'when sorting by lowest score' do
      let(:params) { { sort_by: 'lowest_score' } }

      it 'returns ratings sorted by lowest score first' do
        expect(fetch_service).to eq([rating2, rating3, rating1])
      end
    end

    context 'when filtering by non-existent movie_id' do
      let(:params) { { movie_id: 99_999 } }

      it 'returns an empty result' do
        expect(fetch_service).to be_empty
      end
    end

    context 'when filtering by non-existent user_id' do
      let(:params) { { user_id: 99_999 } }

      it 'returns an empty result' do
        expect(fetch_service).to be_empty
      end
    end
  end
end
