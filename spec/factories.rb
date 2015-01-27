FactoryGirl.define do
  sequence(:skill_name) { |n| "skill_#{n}" }
  sequence(:section_name) { |n| "section_#{n}" }
  sequence(:tag_name) { |n| "tag_#{n}" }
  sequence(:user_name) { |n| "user_#{n}" }

  factory :skill do
    name { generate(:skill_name) }
    featured false
    section
  end

  factory :section do
    name { generate(:section_name) }
  end

  factory :tag do
    name { generate(:tag_name) }
  end

  factory :user do
    name { generate(:user_name) }
    role "student"
  end

  factory :rating do
    user
    skill
    score 1
  end
end
