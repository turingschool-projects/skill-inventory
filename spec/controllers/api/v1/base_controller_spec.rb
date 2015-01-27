describe Api::V1::BaseController do
  controller do
    def show
      Skill.find(params[:id])
    end
  end

  describe "record_not_found" do
    it "renders a 404 and a helpful json message" do
      get :show, id: "not_to_be_found"

      expect(response).to have_http_status(:not_found)
    end
  end
end
