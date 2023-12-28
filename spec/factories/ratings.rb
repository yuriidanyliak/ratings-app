# frozen_string_literal: true

FactoryBot.define do
  factory :rating do
    association :movie
    association :user
    score       { 4 }
  end
end
