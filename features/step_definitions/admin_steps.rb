Given /^I am logged in as an admin$/ do
  User.create!(:login => 'admin',
    :password => 'secret',
    :password_confirmation => 'secret',
    :name => 'Administrator',
    :admin => true)
  Given "I go to to \"the welcome page\""
  When "I fill in \"Username\" with \"admin\""
  When "I fill in \"Password\" with \"secret\""
  When "I press \"Login\""
end

Given /^a page "([^\"]*)" exists$/ do |title|
  Factory.create(:page, :title => title)
end

Given /^a page "([^\"]*)" exists translated to "([^\"]*)"$/ do |title, translated_title|
  page = Factory.create(:page, :title => title)
  Factory.create(:romanian_page_translation, :page => page, :title => translated_title)
end

Given /^a layout "([^\"]*)" exists$/ do |name|
  Factory.create(:layout, :name => name)
end

Then /^the "([^\"]*)" layout should be saved for "([^\"]*)" locale$/ do |name, locale|
  layout = Layout.find_by_name(name)
  layout.translated_locales.should include(locale.to_sym)
end

Given /^a snippet "([^\"]*)" exists$/ do |name|
  Factory.create(:snippet, :name => name)
end

Then /^the "([^\"]*)" snippet should be saved for "([^\"]*)" locale$/ do |name, locale|
  snippet = Snippet.find_by_name(name)
  snippet.translated_locales.should include(locale.to_sym)
end