describe Skill do

  describe "validations" do
    it "must have a name" do
      skill = build(:skill, name: "")
      expect(skill).to_not be_valid
    end

  end
end
