# frozen_string_literal: true

module API
  module Entities
    class Rating < Grape::Entity
      expose :score, documentation: { type: 'Integer', desc: 'Rating score' }
      expose :review, documentation: { type: 'String', desc: 'Review comment' }
      expose :movie_title, documentation: { type: 'String', desc: 'Movie title' }
      expose :movie_year, documentation: { type: 'String', desc: 'Movie year' }
      expose :user_id, documentation: { type: 'String', desc: 'User ID' }

      private

      def movie_title
        object.movie.title
      end

      def movie_year
        object.movie.year
      end
    end
  end
end
