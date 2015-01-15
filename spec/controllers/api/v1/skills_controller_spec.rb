describe Api::V1::SkillsController, type: :controller do

  let(:skill) { create(:skill) }

  describe "index" do

    before do
      FactoryGirl.reload
      2.times { create(:skill, featured: true) }
      2.times { create(:skill) }
    end

    it "returns a json array of skills" do
      get :index, format: :json

      expect(response.status).to eq 200
      expect(json_last_skill["name"]).to eq("skill_4")
    end

    it "returns a json array of featured skills" do
      get :index, format: :json, featured: true

      expect(response.status).to eq 200
      expect(json_last_skill["name"]).to eq("skill_2")
    end
  end

  private

  def json_last_skill
    parsed_json_response_body["skill"].last
  end

end
