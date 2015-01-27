describe Skill do

  describe ".featured" do
    it "returns featured skills" do
      create(:skill, name: "featured", featured: true)
      create(:skill, name: "not-featured", featured: false)

      skills = Skill.featured

      expect(skills.map(&:name)).to eq(["featured"])
    end
  end

  describe "relations" do
    it "belongs to section" do
      skill = create(:skill)

      expect(skill.section).to be_a(Section)
    end

    it "must belong to a section" do
      skill = build(:skill, section: nil)
      expect(skill).to_not be_valid
    end
  end

  describe "validations" do
    it "must have a name" do
      skill = build(:skill, name: "")
      expect(skill).to_not be_valid
    end

    it "featured value must be either boolean true or false" do
      skill = build(:skill, featured: nil)
      expect(skill).to_not be_valid
    end
  end
end
