# frozen_string_literal: true

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

        desc 'Get filtered/sorted list of ratings'
        params do
          optional :movie_id, type: Integer, desc: 'Filter by movie'
          optional :user_id, type: Integer, desc: 'Filter by user'
          optional :sort_by, type: String, desc: 'Sorting option (newest, oldest, highest_score, lowest_score)'
        end
        get do
          ratings = Queries::Ratings::Fetch.new(params).call
          present ratings, with: API::Entities::Rating
        end

        desc 'Get ratings summary'
        params do
          optional :movie_id, type: Integer, desc: 'Filter by movie'
          optional :user_id, type: Integer, desc: 'Filter by user'
        end
        get 'summary' do
          ratings = Queries::Ratings::Fetch.new(params).call
          summary = Queries::Ratings::Summary.new(ratings).call
          present summary
        end
      end
    end
  end
end
