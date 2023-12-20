# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre do
  it { is_expected.to have_many(:movies).dependent(:restrict_with_exception) }

  it { is_expected.to validate_presence_of(:name) }
end
