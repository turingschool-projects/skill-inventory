describe Api::V1::SectionsController do

  describe "index" do

    it "returns a json array of all sections" do
      create(:section, number: 1)
      create(:section, number: 2)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.response).to have_http_status(:ok)
      expect(json_response.section_number).to eq(2)
    end
  end

  private

  class JsonResponse
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def response_body
      JSON.parse(response.body)
    end

    def section_number
      response_body["section"].last["number"]
    end

  end
end
