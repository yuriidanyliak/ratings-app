# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it { is_expected.to belong_to(:genre) }
  it { is_expected.to have_many(:ratings).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:title) }
end
