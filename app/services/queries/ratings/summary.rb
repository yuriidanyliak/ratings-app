# frozen_string_literal: true

module Queries
  module Ratings
    class Summary
      def initialize(ratings)
        @ratings = ratings
      end

      def call
        return {} if ratings.blank?

        {
          average_rating: ratings.average(:score).round(2),
          total_ratings: ratings.count,
          rating_distribution: rating_distribution(ratings)
        }
      end

      private

      attr_reader :ratings

      def rating_distribution(ratings)
        (1..5).index_with do |score|
          ratings.where(score: score).count
        end
      end
    end
  end
end
