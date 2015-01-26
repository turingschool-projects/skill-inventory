FactoryGirl.define do
  sequence(:skill_name) { |n| "skill_#{n}" }

  factory :skill do
    name { generate(:skill_name) }
    featured false
    section
  end

  factory :section do
    number 1
  end
end
