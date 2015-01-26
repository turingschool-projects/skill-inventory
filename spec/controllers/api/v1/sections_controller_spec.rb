describe Api::V1::SectionsController do

  describe "index" do

    it "returns a json array of all sections" do
      create(:sections, number: 1)
      create(:sections, number: 2)

      get :index, format: :json

      expect(response.status).to eq 200
      expect(json_last_section_number).to eq(2)
    end
  end

  private

  def json_last_section_number
    parsed_json_response_body["section"].last["number"]
  end
end
