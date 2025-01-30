# frozen_string_literal: true

module Queries
  module Ratings
    class Fetch
      def initialize(params)
        @params = params
      end

      def call
        ratings = Rating.includes(:movie)

        ratings = apply_filtering(ratings)
        apply_sorting(ratings)
      end

      private

      def apply_filtering(ratings)
        conditions = @params.slice(:movie_id, :user_id)
        ratings = ratings.where(conditions) if conditions.compact.any?
        ratings
      end

      def apply_sorting(ratings)
        return ratings unless @params[:sort_by]

        case @params[:sort_by]
        when 'newest' then ratings.order(created_at: :desc)
        when 'oldest' then ratings.order(created_at: :asc)
        when 'highest_score' then ratings.order(score: :desc)
        when 'lowest_score' then ratings.order(score: :asc)
        end
      end
    end
  end
end
