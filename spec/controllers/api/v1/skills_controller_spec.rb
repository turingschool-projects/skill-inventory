describe Api::V1::SkillsController do

  describe "index" do

    it "returns status 200 on success" do
      get :index, format: :json

      expect(response.status).to eq 200
    end

    it "returns a json array of skills" do
      create(:skill, name: "tdd")

      get :index, format: :json

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
    let!(:group) { create(:group) }

    it "creates a skill (with full parameters)" do
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

    context "when skill is invalid" do
      it "returns a 422 status code" do
        post :create, format: :json, skill: { name: nil }
        expect(response.status).to eq 422
      end

      it "responds with error messages if name missing" do
        post :create, format: :json, skill: {
                                               name: "",
                                               group: group.name
                                            }

        expect(json_response_error_message).to eq(["Name can't be blank"])
      end

      it "responds with error messages if group missing" do
        post :create, format: :json, skill: {
          name: "created",
          group: ""
        }

        expect(json_response_error_message).to eq(["Group can't be blank"])
      end
    end
  end

  describe "show" do
    let!(:skill) { create(:skill, name: "show_skill") }

    it "returns status 200 on success" do
      get :show, format: :json, id: skill.id

      expect(response.status).to eq 200
    end

    it "returns an individual skill" do
      get :show, format: :json, id: skill.id

      expect(json_response_skill_name).to eq("show_skill")
    end
  end

  describe "update" do
    let!(:skill) { create(:skill) }

    it "returns status 200 on success" do
      put :update, format: :json, id: skill.id, skill: { name: "skill" }

      expect(response.status).to eq 200
    end

    it "updates a skill" do
      group_1 = create(:group, name: "before_updated_group")
      group_2 = create(:group, name: "after_updated_group")

      put :update, format: :json,
                   id: skill.id,
                   skill: {
                            name: "after_updated_name",
                            featured: true,
                            group: group_2.name
                          }

      expect(json_response_skill_name).to eq("after_updated_name")
      expect(json_response_skill_featured).to eq(true)
      expect(json_response_skill_group_id).to eq(group_2.id)
    end

    it "returns status 422 on failure" do
      put :update, format: :json, id: skill.id, skill: { name: "" }

      expect(response.status).to eq 422
    end

    it "responds with error messages if a skill fails to update" do
      put :update, format: :json, id: skill.id, skill: { name: "" }

      expect(json_response_error_message).to eq(["Name can't be blank"])
    end
  end

  describe "destroy" do
    let!(:skill) { create(:skill) }

    it "returns status 200 on success" do
      delete :destroy, format: :json, id: skill.id

      expect(response.status).to eq 200
    end

    it "destroys a skill" do
      delete :destroy, format: :json, id: skill.id

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
