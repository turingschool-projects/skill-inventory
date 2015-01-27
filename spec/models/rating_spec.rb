describe Rating do

  it "is valid" do
    user = create(:user)
    skill = create(:skill)
    rating = create(:rating, user_id: user.id, skill_id: skill.id)

    expect(rating).to be_valid
  end

  it "is invalid without a user_id" do
    user = create(:user)
    rating = create(:rating, user_id: "")

    expect(rating).to_not be_valid
  end
end
