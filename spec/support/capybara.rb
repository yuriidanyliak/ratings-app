# frozen_string_literal: true

# See: https://medium.com/table-xi/a-quick-guide-to-rails-system-tests-in-rspec-b6e9e8a8b5f6
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  ##
  # Run specs with `DRIVEN_BY=selenium_chrome bin/rspec` to run specs with opening a browser.
  config.before(:each, :js, type: :system) do
    if ENV['DRIVEN_BY'].present?
      driven_by ENV['DRIVEN_BY'].underscore.to_sym
    else
      # See: https://stackoverflow.com/a/53126253/3238444
      driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1000]
    end
  end
end
