describe Group do

  describe "relations" do
  end

  describe "validations" do
    it "must have a name" do
      expect { create(:group, name: "") }.to raise_error ActiveRecord::RecordInvalid
    end

    it "must have a unique name" do
      create(:group, name: "unique")

      expect { create(:group, name: "unique") }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
