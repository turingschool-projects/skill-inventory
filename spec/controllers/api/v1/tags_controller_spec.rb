describe Api::V1::TagsController do

  describe "index" do

    it "returns a json array of all tags" do
      tag1 = create(:tag)
      tag2 = create(:tag)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.tag_name).to eq(tag2.name)
    end
  end
end
