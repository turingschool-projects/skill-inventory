describe Api::V1::SectionsController do

  describe "index" do

    it "returns a json array of all sections" do
      create(:section, number: 1)
      create(:section, number: 2)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.section_number).to eq(2)
    end
  end
end
