describe Api::V1::SkillsController do

  describe "index" do

    it "returns a json array of skills" do
      create(:skill, name: "tdd")

      get :index, format: :json

      expect(response.status).to eq 200
      expect(json_response_last_skill_name).to eq("tdd")
    end

    it "returns a json array of featured skills" do
      create(:skill, name: "whatever", featured: false)
      create(:skill, name: "rspec", featured: true)

      get :index, format: :json, featured: true

      expect(response.status).to eq 200
      expect(json_response_last_skill_name).to eq("rspec")
    end
  end

  describe "create" do

    it "creates a skill (with full parameters)" do
      group = create(:group)
      post :create, format: :json, skill: {
                                            name: "created",
                                            featured: true,
                                            group: group.name
                                          }

      expect(response.status).to eq 201
      expect(json_response_created_skill_name).to eq("created")
      expect(json_response_created_skill_featured).to eq(true)
      expect(json_response_created_skill_group_id).to eq(group.id)
    end

    it "responds with error messages if a skill fails to create" do
      post :create, format: :json, skill: { name: "" }

      expect(response.status).to eq 422
      expect(json_response_uniquenss_error_message).to eq(["Name can't be blank"])
    end
  end

  private

  def json_response_last_skill_name
    parsed_json_response_body["skill"].last["name"]
  end

  def json_response_created_skill_name
    parsed_json_response_body["skill"]["name"]
  end

  def json_response_created_skill_featured
    parsed_json_response_body["skill"]["featured"]
  end

  def json_response_created_skill_group_id
    parsed_json_response_body["skill"]["group_id"]
  end

  def json_response_uniquenss_error_message
    parsed_json_response_body["skill"]["errors"]
  end

end
