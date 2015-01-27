describe Section do

  describe "validations" do
    it "must have a name" do
      section = build(:section, name: nil)
      expect(section).to_not be_valid
    end
  end
end
