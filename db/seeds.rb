cohort_1 = Cohort.create(
  name: "1409"
)

cohort_2 = Cohort.create(
  name: "1410"
)

first_student = User.create(
  name: "Sam",
  token: "456",
  uid: "123",
  thumbnail_url: "https://avatars2.githubusercontent.com/u/6923345?v=3&s=460",
  cohort_id: cohort_1.id
)

second_student = User.create(
  name: "Chandra",
  token: "456",
  uid: "123",
  thumbnail_url: "https://avatars1.githubusercontent.com/u/8561841?v=3&s=400",
  cohort_id: cohort_2.id
)

User.create(
  name: "Steve",
  role: "instructor",
  token: "456",
  uid: "123",
  thumbnail_url: "https://avatars2.githubusercontent.com/u/251000?v=3&s=460",
)

rails_skill = Skill.create(
  name: "Ruby on Rails"
)

active_record_skill = Skill.create(
  name: "ActiveRecord"
)

ember_skill = Skill.create(
  name: "Ember"
)

java_script_skill = Skill.create(
  name: "JavaScript"
)

html_skill = Skill.create(
  name: "HTML"
)

front_end_tag = Tag.create(
  name: "Front End"
)

back_end_tag = Tag.create(
  name: "Back End"
)

rails_skill.tags << back_end_tag
active_record_skill.tags << back_end_tag
html_skill.tags << front_end_tag
java_script_skill.tags << front_end_tag
ember_skill.tags << front_end_tag
rails_skill.tags << front_end_tag

cohort_1.skills << html_skill
cohort_1.skills << rails_skill

cohort_2.skills << java_script_skill
cohort_2.skills << ember_skill

Rating.create(
  user_id: first_student.id,
  skill_id: html_skill.id,
  score: 4
)

Rating.create(
  user_id: first_student.id,
  skill_id: ember_skill.id,
  score: 3
)

Rating.create(
  user_id: second_student.id,
  skill_id: rails_skill.id,
  score: 2
)

Rating.create(
  user_id: second_student.id,
  skill_id: java_script_skill.id,
  score: 5
)

Rating.create(
  user_id: second_student.id,
  skill_id: active_record_skill.id,
  score: 4
)
