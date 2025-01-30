# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :genre
  has_many :ratings, dependent: :destroy

  validates :title, presence: true

  def rating_score
    ratings.average(:score)
  end
end
