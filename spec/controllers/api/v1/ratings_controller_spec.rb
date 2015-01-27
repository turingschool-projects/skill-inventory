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
end
