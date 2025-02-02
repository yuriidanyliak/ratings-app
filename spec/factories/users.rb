# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    full_name { 'John Doe' }
    email { 'john.doe@example.com' }
  end
end
