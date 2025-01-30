# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    association :genre
    title { 'The Dark Knight' }
    year { 2008 }
  end
end
