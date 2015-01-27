describe Api::V1::TagsController do

  describe "index" do

    it "returns a json array of all tags" do
      tag1 = create(:tag)
      tag2 = create(:tag)

      get :index, format: :json

      json_response = JsonResponse.new(response)
      expect(json_response.headers).to have_http_status(:ok)
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
      expect(json_response.json_tag["skills"]).to eq([skill1.id, skill2.id])
    end
  end
end
