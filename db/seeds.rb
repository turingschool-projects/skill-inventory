skills = Skill.create([{ name: 'skill1', featured: true },
              { name: 'skill2', featured: true },
              { name: 'skill3', featured: false },
              { name: 'skill4', featured: true },
              { name: 'skill5', featured: false },
             ])

puts " Successfully added #{skills.count} skills from seed data. ".center(70, '~*~')
puts
