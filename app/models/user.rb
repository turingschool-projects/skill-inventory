class User < ActiveRecord::Base
  belongs_to :cohort

  def index
    # @students = 
  end
end
