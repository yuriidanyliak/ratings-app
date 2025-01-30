# frozen_string_literal: true

require 'rails_helper'

describe Queries::Ratings::Summary do
  subject(:summary_service) { described_class.new(ratings).call }

  let(:movie) { create(:movie) }
  let(:user) { create(:user) }

  describe '#call' do
    context 'when there are multiple ratings' do
      let(:rating1) { create(:rating, score: 5, movie: movie, user: user) }
      let(:rating2) { create(:rating, score: 4, movie: movie, user: user) }
      let(:rating3) { create(:rating, score: 3, movie: movie, user: user) }
      let(:rating4) { create(:rating, score: 3, movie: movie, user: user) }
      let(:rating5) { create(:rating, score: 1, movie: movie, user: user) }

      let(:ratings) { Rating.all }

      before do
        rating1
        rating2
        rating3
        rating4
        rating5
      end

      it 'calculates the correct average rating' do
        expect(summary_service[:average_rating]).to eq(3.2)
      end

      it 'returns the correct total ratings count' do
        expect(summary_service[:total_ratings]).to eq(5)
      end

      it 'returns the correct rating distribution' do
        expect(summary_service[:rating_distribution]).to eq({ 1 => 1, 2 => 0, 3 => 2,
                                                              4 => 1, 5 => 1 })
      end
    end

    context 'when there are no ratings' do
      let(:ratings) { Rating.none }

      it 'returns an empty hash' do
        expect(summary_service).to eq({})
      end
    end

    context 'when all ratings have the same score' do
      let(:rating1) { create(:rating, score: 5, movie: movie, user: user) }
      let(:rating2) { create(:rating, score: 5, movie: movie, user: user) }
      let(:rating3) { create(:rating, score: 5, movie: movie, user: user) }

      let(:ratings) { Rating.all }

      before do
        rating1
        rating2
        rating3
      end

      it 'calculates the correct average rating' do
        expect(summary_service[:average_rating]).to eq(5.0)
      end

      it 'returns the correct total ratings count' do
        expect(summary_service[:total_ratings]).to eq(3)
      end

      it 'returns the correct rating distribution' do
        expect(summary_service[:rating_distribution]).to eq({ 1 => 0, 2 => 0, 3 => 0,
                                                              4 => 0, 5 => 3 })
      end
    end
  end
end
