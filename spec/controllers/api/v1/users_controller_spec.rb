describe Api::V1::UsersController do

  describe "editing a user" do
    it "can add a cohort to a user" do
      user = create(:user, cohort_id: nil)
      cohort = create(:cohort)

      put :update, format: :json,
                   id: user.id,
                   user: {
                           cohort_id: cohort.id
                          }
      json_response = JSON.parse(response.body)

      expect(json_response["user"]["id"]).to eq(user.id)
      expect(json_response["user"]["cohort_id"]).to eq(cohort.id)
    end
  end
end

