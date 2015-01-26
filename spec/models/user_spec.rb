require 'spec_helper'

describe User do
  it "knows if it is a student" do
    user = User.new
    user.role = "student"

    expect(user.student?).to be_truthy
  end

  it "knows if it is an instructor" do
    user = User.new
    user.role = "instructor"

    expect(user.instructor?).to be_truthy
  end

end
