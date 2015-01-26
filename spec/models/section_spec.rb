describe Section do

  describe "validations" do
    it "must have a number" do
      expect { create(:section, number: nil) }.to raise_error ActiveRecord::RecordInvalid
    end

  end
end
