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
    it "belongs to group" do
      skill = create(:skill)

      expect(skill.group).to be_a(Group)
    end

    it "must belong to a group" do
      expect { create(:skill, group: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "validations" do
    it "must have a name" do
      expect { create(:skill, name: "") }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "featured value must be either boolean true or false" do
      expect { create(:skill, featured: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
