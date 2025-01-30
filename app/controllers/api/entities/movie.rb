# frozen_string_literal: true

module API
  module Entities
    class Movie < Grape::Entity
      expose :title, documentation: { type: 'String', desc: 'Film title' }
      expose :year, documentation: { type: 'String', desc: 'Film year' }
      expose :genre, documentation: { type: 'String', desc: 'Film genre' }
      expose :rating_score, documentation: { type: 'Integer', desc: 'Average ratings score' }

      private

      def genre
        object.genre.name
      end
    end
  end
end
