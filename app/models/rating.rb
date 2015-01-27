class Rating < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user

  validates_presence_of :user_id
end
