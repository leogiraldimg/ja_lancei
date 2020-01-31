Given (/^I am on the create manager account page$/) do
    visit new_manager_path
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
    fill_in(field.gsub(' ', '_'), :with => value)
end

When (/^I fill the manager registration form$/) do
    steps %Q{
        When I fill in "manager_email" with "teste.001@teste.com.br"
        When I fill in "manager_first_name" with "Teste"
        When I fill in "manager_last_name" with "001"
        When I fill in "manager_password" with "teste001"
        When I fill in "manager_password_confirmation" with "teste001"
    }
end