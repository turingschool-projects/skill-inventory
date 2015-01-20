require 'rails_helper'

feature "user signs in with Github" do
  scenario "is able to log in" do
    mock_github_oauth

    visit '/'
    click_on('Login with Github')
    expect(page).to have_content('Welcome John')
  end
end
