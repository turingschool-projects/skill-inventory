require 'spec_helper'

describe User do

  it "sets default role to student" do
    user = User.new

    expect(user.role).to eq("student")
  end

end
