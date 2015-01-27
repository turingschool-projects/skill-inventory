describe Section do

  describe "validations" do
    it "must have a name" do
      expect { create(:section, name: nil) }.to raise_error ActiveRecord::RecordInvalid
    end

  end
end
