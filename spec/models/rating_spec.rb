describe Rating do

  it "is valid" do
    rating = create(:rating)

    expect(rating).to be_valid
  end

  it "is invalid without a user" do
    rating = build(:rating, user: nil)

    expect(rating).to be_invalid
  end

  it "is invalid without a skill" do
    rating = build(:rating, skill: nil)

    expect(rating).to be_invalid
  end

  it "is invalid if score is not between 0 - 4" do
    rating = build(:rating, score: 5)

    expect(rating).to be_invalid
  end

end
