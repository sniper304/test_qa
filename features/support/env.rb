require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.default_driver = :selenium
Capybara.app_host = 'http://new.timetoriot.com'
Capybara.default_max_wait_time = 5
