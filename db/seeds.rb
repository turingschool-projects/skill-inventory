# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Skill.create([{ name: 'skill1', featured: true },
              { name: 'skill2', featured: true },
              { name: 'skill3', featured: false },
              { name: 'skill4', featured: true },
              { name: 'skill5', featured: false },
             ])
