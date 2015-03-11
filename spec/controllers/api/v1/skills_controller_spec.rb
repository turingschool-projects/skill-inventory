describe Api::V1::SkillsController do

  describe "featured skills" do
    it "can feature a skill" do
      skill = create(:skill, name: "tdd")
      cohort = create(:cohort, name: "1409")

      post :feature, format: :json, featured_skill: { skill_id: skill.id,
                                                      cohort_id: cohort.id
                                                    }

      json_response = JSON.parse(response.body)

      expect(json_response["skill"]["cohort_id"]).to eq(cohort.id)
      expect(json_response["skill"]["skill_id"]).to eq(skill.id)
    end

    it "can unfeature a skill" do
      






    end
  end

  describe "index" do
    it "returns a json array of skills" do
      create(:skill, name: "tdd")

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.last_skill_name).to eq("tdd")
    end
  end

  describe "create" do
    it "creates a skill (with full parameters)" do
      skill_attributes = attributes_for(:skill)

      post :create, format: :json, skill: skill_attributes

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:created)
      expect(json_response.skill_name).to eq(skill_attributes[:name])
    end

    it "responds with error messages if a skill fails to create" do
      post :create, format: :json, skill: { name: "" }

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:unprocessable_entity)
      expect(json_response.skill_error_message).to eq(["Name can't be blank"])
    end
  end

  describe "show" do
    it "returns an individual skill" do
      skill = create(:skill, name: "show_skill")

      get :show, format: :json, id: skill.id

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.skill_name).to eq("show_skill")
    end
  end

  describe "update" do
    it "updates a skill" do
      skill = create(:skill, name: "before_updated_name")

      put :update, format: :json,
                   id: skill.id,
                   skill: {
                            name: "after_updated_name",
                          }

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.skill_name).to eq("after_updated_name")
    end

    it "responds with error messages if a skill fails to update" do
      skill = create(:skill)

      put :update, format: :json, id: skill.id, skill: { name: "" }

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:unprocessable_entity)
      expect(json_response.skill_error_message).to eq(["Name can't be blank"])
    end
  end

  describe "destroy" do
    it "destroys a skill" do
      skill = create(:skill)

      delete :destroy, format: :json, id: skill.id

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.skill_name).to eq(skill.name)
    end
  end
end
