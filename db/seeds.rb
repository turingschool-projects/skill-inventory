require "factory_girl_rails"

FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: false)
FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: false)

puts " Successfully added skills from seed data. ".center(70, '~*~')

FactoryGirl.create(:section, number: 1)
FactoryGirl.create(:section, number: 2)
FactoryGirl.create(:section, number: 3)
FactoryGirl.create(:section, number: 4)

puts " Successfully added groups from seed data. ".center(70, '~*~')
