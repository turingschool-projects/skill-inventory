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

    context "with restrictions" do
      it "allows instructors to create skills"

      it "prevents students from creating skills"
    end

    it "creates a skill (with full parameters)" do
      group = create(:group)
      post :create, format: :json, skill: {
                                            name: "created",
                                            featured: true,
                                            group: group.name
                                          }

      expect(response.status).to eq 201
      expect(json_response_skill_name).to eq("created")
      expect(json_response_skill_featured).to eq(true)
      expect(json_response_skill_group_id).to eq(group.id)
    end

    it "responds with error messages if a skill fails to create" do
      post :create, format: :json, skill: { name: "" }

      expect(response.status).to eq 422
      expect(json_response_error_message).to eq(["Name can't be blank"])
    end
  end

  describe "show" do

    it "returns an individual skill" do
      skill = create(:skill, name: "show_skill")

      get :show, format: :json, id: skill.id

      expect(response.status).to eq 200
      expect(json_response_skill_name).to eq("show_skill")
    end
  end

  describe "update" do

    it "updates a skill" do
      group_1 = create(:group, name: "before_updated_group")
      group_2 = create(:group, name: "after_updated_group")
      skill = create(:skill, name: "before_updated_name", group: group_1)

      put :update, format: :json,
                   id: skill.id,
                   skill: {
                            name: "after_updated_name",
                            featured: true,
                            group: group_2.name
                          }

      expect(response.status).to eq 200
      expect(json_response_skill_name).to eq("after_updated_name")
      expect(json_response_skill_featured).to eq(true)
      expect(json_response_skill_group_id).to eq(group_2.id)
    end

    it "responds with error messages if a skill fails to update" do
      skill = create(:skill)

      put :update, format: :json, id: skill.id, skill: { name: "" }

      expect(response.status).to eq 422
      expect(json_response_error_message).to eq(["Name can't be blank"])
    end
  end

  describe "destroy" do

    it "destroys a skill" do
      skill = create(:skill)

      delete :destroy, format: :json, id: skill.id

      expect(response.status).to eq 200
      expect(json_response_skill_name).to eq(skill.name)
    end
  end

  private

  def json_skill
    parsed_json_response_body["skill"]
  end

  def json_response_last_skill_name
    json_skill.last["name"]
  end

  def json_response_skill_name
    json_skill["name"]
  end

  def json_response_skill_featured
    json_skill["featured"]
  end

  def json_response_skill_group_id
    json_skill["group_id"]
  end

  def json_response_error_message
    json_skill["errors"]
  end

end
