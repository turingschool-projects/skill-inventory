FactoryGirl.define do
  sequence(:skill_name) { |n| "skill_#{n}" }
  sequence(:tag_name) { |n| "tag_#{n}" }
  sequence(:user_name) { |n| "user_#{n}" }

  factory :skill do
    name { generate(:skill_name) }
  end

  factory :tag do
    name { generate(:tag_name) }
  end

  factory :cohort do
    name "1409"
  end

  factory :user do
    name { generate(:user_name) }
    role "student"
    token "12345"
    uid "9876"
    thumbnail_url "http://google.com"
    username "chasevh"
    email "chase@example.com"
    cohort
  end

  factory :rating do
    score 1
    user
    skill
  end
end
