When(/^I visit page "(.*?)"$/) do |url|
  visit url
  # save_and_open_screenshot
end

Then(/^I click on button "([^"]*)"$/) do |button_name|
  click_button button_name
  # save_and_open_screenshot
end

And(/^I see a button "([^"]*)"$/) do |button|
  expect(page).to have_css('button#add')
end

And(/^I should see an inputs: "([^"]*)"$/) do |inputs|
  array_of_inputs = inputs.split(',')

  array_of_inputs.each do |input|
    expect(page).to have_css("input##{input}")
  end
end

And(/^I should see text area "([^"]*)"$/) do |textarea|
  page.evaluate_script("document.getElementById('#{textarea}').style.display = 'block'")
  expect(page).to have_css("textarea##{textarea}")
end

And(/^I should see hidden inputs "([^"]*)"$/) do |inputs|
  array_of_inputs = inputs.split(',')

  array_of_inputs.each do |input|
    page.evaluate_script("document.getElementById('#{input}').style.display = 'block'")
    expect(page).to have_css(".switch input##{input}")
  end
end

Then(/^See buttons "([^"]*)" and "([^"]*)"$/) do |button1, button2|
  expect(page).to have_css("button##{button1.downcase}")
  expect(page).to have_css("button##{button2.downcase}")
end

Then(/^I should see error for required fields "([^"]*)"$/) do |fields|
  array_of_fields = fields.split(',')

  array_of_fields.each do |field|
    expect(page).to have_css("div#error-#{field}")
  end
end

And(/^I fill text "([^"]*)" in "([^"]*)" field$/) do |text, field|
  find("input##{field}").set(text)
end

Then(/^I see an error "([^"]*)"$/) do |message|
  expect(page).to have_content message
end

Then(/^I don't see an error "([^"]*)"$/) do |message|
  expect(page).not_to have_content message
end

And(/^Field "([^"]*)" are disabled$/) do |field|
  find("##{field}").disabled?
end

Then(/^I see an error class "([^"]*)" in "([^"]*)" field$/) do |error_class, field|
  find("##{field}.#{error_class}")
end

And(/^I fill text "([^"]*)" in "([^"]*)" textarea/) do |text, field_class|
  find("div.fr-element.fr-view p").set(text)
end

Then(/^Url should be "([^"]*)"$/) do |url|
  # save_and_open_screenshot
  current_url.should == url
end

Then(/^I see a text "([^"]*)"$/) do |text|
  expect(page).to have_content text
end
