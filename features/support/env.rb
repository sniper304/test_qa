require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.current_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.app_host = 'http://new.timetoriot.com'
Capybara.default_max_wait_time = 5
Capybara.register_driver :poltergeist do |app|
  options = {
      js_errors: false,
      timeout: 120,
      debug: false#,
      # phantomjs_options: ['--load-images=no', '--disk-cache=false'],
      # inspector: true
  }
  Capybara::Poltergeist::Driver.new(app, options)
end
