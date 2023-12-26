# frozen_string_literal: true

require 'grape-swagger'

module API
  class Root < Grape::API
    format :json

    mount V1::Movies
    mount V1::Ratings
    add_swagger_documentation
  end
end
