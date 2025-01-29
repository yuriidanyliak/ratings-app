# frozen_string_literal: true

# app/api/v1/movies_api.rb

module API
  module V1
    class Movies < Grape::API
      version 'v1', using: :path
      format :json

      resource :movies do
        desc 'Get a list of all movies'
        get do
          movies = Movie.all.includes(:genre, :ratings)
          present movies, with: API::Entities::Movie
        end

        desc 'Get a specific movie'
        params do
          requires :id, type: Integer, desc: 'Movie ID'
        end
        get ':id' do
          Movie.find(params[:id])
        end
      end
    end
  end
end
