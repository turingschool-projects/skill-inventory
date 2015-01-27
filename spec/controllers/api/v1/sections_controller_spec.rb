describe Api::V1::SectionsController do

  describe "index" do

    it "returns a json array of all sections" do
      section = create(:section)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.section_name).to eq(section.name)
    end
  end
end
