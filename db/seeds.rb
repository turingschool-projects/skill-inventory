require "factory_girl_rails"

FactoryGirl.create(:section, name: "Module 1")
FactoryGirl.create(:section, name: "Module 2")
FactoryGirl.create(:section, name: "Module 3")
FactoryGirl.create(:section, name: "Module 4")

puts " Successfully added sections from seed data. ".center(70, "~*~")

FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: false)
FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: false)

puts " Successfully added skills from seed data. ".center(70, "~*~")
