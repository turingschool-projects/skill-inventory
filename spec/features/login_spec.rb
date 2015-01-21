describe "login" do
  it "unauthenticated user visits root page" do
    visit login_path
    expect(page).to have_content("Login With Github")
  end
end
