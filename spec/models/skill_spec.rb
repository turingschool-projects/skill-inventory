describe Skill do
  describe ".featured" do
    it "returns featured skills" do
      create(:skill, name: "featured", featured: true)
      create(:skill, name: "not-featured", featured: false)

      skills = Skill.featured

      expect(skills.map(&:name)).to eq(["featured"])
    end
  end
end
