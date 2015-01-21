require 'rails_helper'
# include MockOmniauth

feature "user who signs in with Github" do
  scenario "is able to log in" do
    mock_github_oauth

    visit '/'
    click_on('Login with Github')
    expect(page).to have_content('Welcome John')
  end
end
