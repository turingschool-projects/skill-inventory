describe Api::V1::RatingsController do
  describe "index" do
    it "returns a json array of all ratings" do
      rating = create(:rating)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.last_rating_id).to eq(rating.id)
    end
  end

  describe "show" do
    it "returns a rating" do
      rating = create(:rating)

      get :show, format: :json, id: rating.id

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.rating_id).to eq(rating.id)
    end
  end

  describe "create" do
    it "creates a rating" do
      user = create(:user)
      skill = create(:skill)
      allow_any_instance_of(Api::V1::BaseController).to receive(:current_user).and_return(user)

      expect {
        post :create, format: :json, rating: { "skill" => skill.id, "score" => 1 }
       }.to change{ Rating.count }.by(1)
    end
  end
end
