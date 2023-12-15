# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Main', :js do
  before do
    visit(root_path)
  end

  it 'with valid inputs' do
    expect(page).to have_content('Yay!')
  end
end
