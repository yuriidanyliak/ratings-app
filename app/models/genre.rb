# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :movies, dependent: :restrict_with_exception

  validates :name, presence: true
end
