class User < ActiveRecord::Base
  belongs_to :cohort

  def self.create_from_oauth(auth_hash)
    create(
      name: auth_hash[:info][:name],
    )
  end

end
