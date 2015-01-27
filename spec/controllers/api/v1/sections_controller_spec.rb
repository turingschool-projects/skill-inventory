describe Api::V1::SectionsController do

  describe "index" do
    it "returns a json array of all sections" do
      section1 = create(:section)
      section2 = create(:section)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.last_section_name).to eq(section2.name)
    end
  end

  describe "show" do
    it "returns a section" do
      section = create(:section)

      get :show, format: :json, id: section.id

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.section_name).to eq(section.name)
    end
  end
end
