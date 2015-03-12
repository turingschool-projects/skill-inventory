class FeaturedCohortSkill < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :skill
end
