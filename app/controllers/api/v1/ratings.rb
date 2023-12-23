# app/api/v1/ratings_api.rb

module API
  module V1
    class Ratings < Grape::API
      version 'v1', using: :path
      format :json

      resource :ratings do
        desc 'Create a new rating'
        params do
          requires :user_id, type: Integer, desc: 'User ID'
          requires :movie_id, type: Integer, desc: 'Movie ID'
          requires :score, type: Integer, desc: 'Rating score'
          optional :review, type: String, desc: 'Rating review'
        end
        post do
          Rating.create!(user_id: params[:user_id], movie_id: params[:movie_id], score: params[:score], review: params[:review])
        end
      end
    end
  end
end
