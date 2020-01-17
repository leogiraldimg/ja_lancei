Given (/^I am on the root page$/) do
    visit "welcome#index"
end

When /^I click the (.*) button$/ do |button_name|
    click_button button_name
end

Then (/^I should see the Welcome P.O. page$/) do
    expect(page).to have_xpath('.//p[@id="titulo-pagina-welcome-po"]') 
end

Then (/^I should see the Welcome Collaborator page$/) do
    expect(page).to have_xpath('.//p[@id="titulo-pagina-welcome-collaborator"]') 
end