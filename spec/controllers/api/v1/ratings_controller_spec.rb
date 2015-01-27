describe Api::V1::RatingsController do

  describe "index" do
    it "returns a json array of all ratings" do
      create(:rating, id: 8)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.last_rating_id).to eq(8)
    end

  end
end
