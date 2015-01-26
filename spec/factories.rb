FactoryGirl.define do
  sequence(:skill_name) { |n| "skill_#{n}" }
#  sequence(:group_name) { |n| "group_#{n}" }

  factory :skill do
    name { generate(:skill_name) }
    featured false
    section
  end

  factory :section do
    number 1
#    number { generate(:group_name) }
  end
end
