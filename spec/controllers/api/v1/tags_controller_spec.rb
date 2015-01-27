describe Api::V1::TagsController do

  describe "index" do

    it "returns a json array of all tags" do
      tag1 = create(:tag)
      tag2 = create(:tag)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.first_tag_name).to eq(tag1.name)
      expect(json_response.last_tag_name).to eq(tag2.name)
    end
  end

  describe "show" do
    it "returns a tag" do
      tag = create(:tag)

      get :show, format: :json, id: tag.id

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.tag_name).to eq(tag.name)
    end
  end

  describe "create" do
    it "creates a tag (with full parameters)" do
      skill1 = create(:skill)
      skill2 = create(:skill)
      tag_attributes = attributes_for(:tag)
      tag_attributes[:skills] = [skill1.id, skill2.id]

      post :create, format: :json, tag: tag_attributes

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:created)
      expect(json_response.tag_name).to eq(tag_attributes[:name])
      expect(json_response.tag_skill_ids).to eq([skill1.id, skill2.id])
    end

    it "responds with error messages if a tag fails to create" do
      post :create, format: :json, tag: { name: "" }

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:unprocessable_entity)
      expect(json_response.tag_error_message).to eq(["Name can't be blank"])
    end
  end

  describe "update" do
    it "updates a tag" do
      skill_1 = create(:skill, name: "skill1")
      skill_2 = create(:skill, name: "skill2")
      tag = create(:tag,
                    name: "before_updated_name",
                    skills: [skill_1, skill_2])

      put :update, format: :json,
      id: tag.id,
      tag: { name: "after_updated_name",
             skill: skill_2.name
           }

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.tag_name).to eq("after_updated_name")
      expect(json_response.tag_skill_ids).to eq([skill_1.id, skill_2.id])
    end

    it "responds with error messages if a tag fails to update" do
      tag = create(:tag)

      put :update, format: :json, id: tag.id, tag: { name: "" }

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:unprocessable_entity)
      expect(json_response.tag_error_message).to eq(["Name can't be blank"])
    end
  end

  describe "destroy" do
    it "destroys a tag" do
      tag = create(:tag)

      delete :destroy, format: :json, id: tag.id

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
      expect(json_response.tag_name).to eq(tag.name)
    end
  end
end
