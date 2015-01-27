FactoryGirl.create(:skill, featured: true)
FactoryGirl.create(:skill, featured: true)
FactoryGirl.create(:skill, featured: false)
FactoryGirl.create(:skill, featured: true)
FactoryGirl.create(:skill, featured: false)

puts " Successfully added skills from seed data. ".center(70, "~*~")

FactoryGirl.create(:section, name: "1")
FactoryGirl.create(:section, name: "2")
FactoryGirl.create(:section, name: "3")
FactoryGirl.create(:section, name: "4")

puts " Successfully added sections from seed data. ".center(70, "~*~")

FactoryGirl.create(:tag)
FactoryGirl.create(:tag)
FactoryGirl.create(:tag)
FactoryGirl.create(:tag)

puts " Successfully added tags from seed data. ".center(70, "~*~")
