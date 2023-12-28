# frozen_string_literal: true

module API
  module Entities
    class Movie < Grape::Entity
      expose :title
      expose :year
      expose :genre
      expose :rating_score

      private

      def genre
        object.genre.name
      end
    end
  end
end
