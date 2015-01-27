FactoryGirl.define do
  sequence(:skill_name) { |n| "skill_#{n}" }
  sequence(:group_name) { |n| "group_#{n}" }
  sequence(:user_name) { |n| "user_#{n}" }

  factory :skill do
    name { generate(:skill_name) }
    featured false
    section
  end

  factory :section do
    number 1
  end

  factory :user do
    name { generate(:user_name) }
    role "student"
  end
end
