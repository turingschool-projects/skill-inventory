FactoryGirl.define do
  sequence(:name) { |n| "skill_#{n}" }

  factory :skill do
    name { generate(:name) }
    featured false           
  end
end
