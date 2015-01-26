describe Api::V1::SkillsController do

  describe "index" do
    it "returns a json array of skills" do
      create(:skill, name: "tdd")

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      json_response = JsonResponse.new(response)
      expect(json_response.last_skill_name).to eq("tdd")
    end

    it "returns a json array of featured skills" do
      create(:skill, name: "whatever", featured: false)
      create(:skill, name: "rspec", featured: true)

      get :index, format: :json, featured: true

      expect(response).to have_http_status(:ok)
      json_response = JsonResponse.new(response)
      expect(json_response.last_skill_name).to eq("rspec")
    end
  end

  describe "create" do
    it "creates a skill (with full parameters)" do
      section = create(:section)
      skill_attributes = attributes_for(:skill)
      skill_attributes[:section] = section.number

      post :create, format: :json, skill: skill_attributes

      expect(response).to have_http_status(:created)
      json_response = JsonResponse.new(response)
      expect(json_response.skill_name).to eq(skill_attributes[:name])
      expect(json_response.skill_featured).to eq(skill_attributes[:featured])
      expect(json_response.skill_section_id).to eq(section.id)
    end

    it "responds with error messages if a skill fails to create" do
      post :create, format: :json, skill: { name: "" }

      expect(response).to have_http_status(:unprocessable_entity)
      json_response = JsonResponse.new(response)
      expect(json_response.error_message).to eq(["Name can't be blank",
                                                 "Section can't be blank"])
    end
  end

  describe "show" do
    it "returns an individual skill" do
      skill = create(:skill, name: "show_skill")

      get :show, format: :json, id: skill.id

      expect(response).to have_http_status(:ok)
      json_response = JsonResponse.new(response)
      expect(json_response.skill_name).to eq("show_skill")
    end
  end

  describe "update" do
    it "updates a skill" do
      section_1 = create(:section, number: 1)
      section_2 = create(:section, number: 2)
      skill = create(:skill, name: "before_updated_name", section: section_1)

      put :update, format: :json,
                   id: skill.id,
                   skill: {
                            name: "after_updated_name",
                            featured: true,
                            section: section_2.number
                          }

      expect(response).to have_http_status(:ok)
      json_response = JsonResponse.new(response)
      expect(json_response.skill_name).to eq("after_updated_name")
      expect(json_response.skill_featured).to eq(true)
      expect(json_response.skill_section_id).to eq(section_2.id)
    end

    it "responds with error messages if a skill fails to update" do
      skill = create(:skill)

      put :update, format: :json, id: skill.id, skill: { name: "" }

      expect(response).to have_http_status(:unprocessable_entity)
      json_response = JsonResponse.new(response)
      expect(json_response.error_message).to eq(["Name can't be blank"])
    end
  end

  describe "destroy" do
    it "destroys a skill" do
      skill = create(:skill)

      delete :destroy, format: :json, id: skill.id

      expect(response).to have_http_status(:ok)
      json_response = JsonResponse.new(response)
      expect(json_response.skill_name).to eq(skill.name)
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

    def json_skill
      response_body["skill"]
    end

    def last_skill_name
      json_skill.last["name"]
    end

    def skill_name
      json_skill["name"]
    end

    def skill_featured
      json_skill["featured"]
    end

    def skill_section_id
      json_skill["section_id"]
    end

    def error_message
      json_skill["errors"]
    end

  end
end
