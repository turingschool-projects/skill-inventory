describe SkillWithRating do

  it "decorates a skill with a rating" do
    rating = create(:rating)
    user = rating.user
    skill = rating.skill

    skill_with_rating = SkillWithRating.new(skill, user)
    expect(skill_with_rating.rating).to eq(rating)
  end

  it "#attributes extends a skill with a rating" do
    rating = create(:rating)

    skill_with_rating = SkillWithRating.new(rating.skill, rating.user)
    skill_attributes = skill_with_rating.attributes

    expect(skill_attributes.keys).to include("rating")
    expect(skill_with_rating.attributes["rating"]).to eq(rating.id)
  end

end