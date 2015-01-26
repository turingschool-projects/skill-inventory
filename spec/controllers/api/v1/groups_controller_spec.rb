describe Api::V1::GroupsController do

  describe "index" do
    it "returns a json array of all groups" do
      create(:group, name: "whatever")
      create(:group, name: "1409")

      get :index, format: :json

      expect(response.status).to eq 200
      expect(json_last_group_name).to eq("1409")
    end
  end

  private

  def json_last_group_name
    parsed_json_response_body["group"].last["name"]
  end
end
