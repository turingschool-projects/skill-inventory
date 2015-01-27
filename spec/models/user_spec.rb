require 'spec_helper'

describe User do

  it "sets default role to student" do
    user = User.new

    expect(user.role).to eq("student")
  end

  it "accepts role of instructor" do
    user = create(:user, role: "instructor")

    expect(user).to be_valid
  end

  it "does not accept role other than student or instructor" do
    user = build(:user, role: "invalid_role")

    expect(user).to_not be_valid
  end

end
