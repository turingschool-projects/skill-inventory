describe Api::V1::SessionsController do
  it "returns an authenticated user" do
    VCR.use_cassette("github_omniauth") do
      post :create, format: :json, :"github-auth-code" => "97ae35127ae09e55ac44"
    end

    expect(response).to have_http_status(:created)
  end
end
