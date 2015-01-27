require "factory_girl_rails"

FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: false)
FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: false)

puts " Successfully added skills from seed data. ".center(70, '~*~')

FactoryGirl.create(:section, name: "1")
FactoryGirl.create(:section, name: "2")
FactoryGirl.create(:section, name: "3")
FactoryGirl.create(:section, name: "4")

puts " Successfully added sections from seed data. ".center(70, '~*~')

FactoryGirl.create(:tag, name: "tag1")
FactoryGirl.create(:tag, name: "tag2")
FactoryGirl.create(:tag, name: "tag3")
FactoryGirl.create(:tag, name: "tag4")

puts " Successfully added tags from seed data. ".center(70, '~*~')
