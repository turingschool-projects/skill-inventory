describe Rating do

  it "is valid" do
    rating = create(:rating)

    expect(rating).to be_valid
  end

  it "is invalid without a user_id" do
    rating = build(:rating, user_id: "")

    expect(rating).to be_invalid
  end

  it "is invalid without a skill_id" do
    user   = build(:user)
    rating = build(:rating, skill_id: "")

    expect(rating).to be_invalid
  end

  it "is invalid if score is not between 0 - 4" do
    user = create(:user)
    rating = build(:rating, score: 5)

    expect(rating).to be_invalid
  end

end
