When(/^I visit page "(.*?)"$/) do |url|
  visit url
  # loop while finished_all_ajax_requests? # Wait for first request,
  # loop until finished_all_ajax_requests? # then wait until they all finish.
  save_and_open_screenshot
end

And(/^Wait until all ajax request finished$/) do
  wait_until
  # Timeout.timeout(Capybara.default_max_wait_time) do
  #   loop while finished_all_ajax_requests? # Wait for first request,
  #   loop until finished_all_ajax_requests? # then wait until they all finish.
  # end
end

Then(/^I see a text "([^"]*)"$/) do |arg1|
  wait_until
  save_and_open_screenshot
  click_button '#add'
end


def wait_until
  loop unless page.has_css?('riot-jobs div.container')
end


#
# def finished_all_ajax_requests?
#   request_count = page.evaluate_script("$.active").to_i
#   request_count && request_count.zero?
# rescue Timeout::Error
# end