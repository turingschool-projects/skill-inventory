m1 = FactoryGirl.create(:section, name: "Module 1")
m2 = FactoryGirl.create(:section, name: "Module 2")
m3 = FactoryGirl.create(:section, name: "Module 3")
m4 = FactoryGirl.create(:section, name: "Module 4")

puts " Successfully added sections from seed data. ".center(70, "~*~")

FactoryGirl.create(:skill, featured: true, section: m1)
FactoryGirl.create(:skill, featured: true, section: m2)
FactoryGirl.create(:skill, featured: false, section: m3)
FactoryGirl.create(:skill, featured: true, section: m4)
FactoryGirl.create(:skill, featured: false, section: m1)

puts " Successfully added skills from seed data. ".center(70, "~*~")

FactoryGirl.create(:tag)
FactoryGirl.create(:tag)
FactoryGirl.create(:tag)
FactoryGirl.create(:tag)

puts " Successfully added tags from seed data. ".center(70, "~*~")
