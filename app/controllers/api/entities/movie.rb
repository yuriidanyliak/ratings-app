# frozen_string_literal: true

module API
  module Entities
    class Movie < Grape::Entity
      expose :title
      expose :year
      expose :genre

      private

      def genre
        object.genre.name
      end
    end
  end
end
