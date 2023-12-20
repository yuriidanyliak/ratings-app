# frozen_string_literal: true

class User < ApplicationRecord
  has_many :ratings, dependent: :destroy

  validates :email, presence: true
end
