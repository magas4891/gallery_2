Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
  profile.native_events = true
end

Capybara.configure do |config|
  # seconds
  config.default_max_wait_time = 10
  config.default_driver = :selenium
end
