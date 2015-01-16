require "factory_girl_rails"

FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: false)
FactoryGirl.create(:skill, name: "skill2", featured: true)
FactoryGirl.create(:skill, name: "skill2", featured: false)

FactoryGirl.create(:group, name: "1407")
FactoryGirl.create(:group, name: "1409")
FactoryGirl.create(:group, name: "1410")
FactoryGirl.create(:group, name: "1412")
