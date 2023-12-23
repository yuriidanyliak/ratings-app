# app/api/v1/movies_api.rb

module API
  module V1
    class Movies < Grape::API
      version 'v1', using: :path
      format :json

      resource :movies do
        desc 'Get a list of all movies'
        get do
          movies = Movie.all
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

      resource :ratings do
        desc 'Create a new rating'
        params do
          requires :user_id, type: Integer, desc: 'User ID'
          requires :movie_id, type: Integer, desc: 'Movie ID'
          requires :score, type: Integer, desc: 'Rating score'
          requires :review, type: String, desc: 'Rating review'
        end
        post do
          Rating.create(user_id: params[:user_id], movie_id: params[:movie_id], score: params[:score], review: params[:review])
        end
      end
    end
  end
end
