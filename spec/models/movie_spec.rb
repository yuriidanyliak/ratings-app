# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it { is_expected.to belong_to(:genre) }
  it { is_expected.to have_many(:ratings).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:title) }

  describe '#rating_score' do
    subject { movie.rating_score }

    let(:movie) { create(:movie) }
    let(:rating_a) { create(:rating, movie: movie, score: 3) }
    let(:rating_b) { create(:rating, movie: movie, score: 5) }

    before do
      rating_a
      rating_b
    end

    it { is_expected.to eq 4.0 }
  end
end
