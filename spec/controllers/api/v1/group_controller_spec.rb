describe Api::V1::GroupsController, type: :controller do

  describe "index" do

    before do
      2.times { create(:group) }
    end

    it "returns a json array of all groups" do
      get :index, format: :json

      expect(response.status).to eq 200
      expect(json_last_group["name"]).to eq("group_2")
    end
  end

  private

  def json_last_group
    parsed_json_response_body["group"].last
  end
end
