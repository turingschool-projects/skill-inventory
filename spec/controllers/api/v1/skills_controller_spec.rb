describe Api::V1::SkillsController do

  describe "index" do

    it "returns a json array of skills" do
      create(:skill, name: "tdd")

      get :index, format: :json

      expect(response.status).to eq 200
      expect(json_last_skill["name"]).to eq("tdd")
    end

    it "returns a json array of featured skills" do
      create(:skill, name: "whatever", featured: false)
      create(:skill, name: "rspec", featured: true)

      get :index, format: :json, featured: true

      expect(response.status).to eq 200
      expect(json_last_skill["name"]).to eq("rspec")
    end
  end

  private

  def json_last_skill
    parsed_json_response_body["skill"].last
  end

end
