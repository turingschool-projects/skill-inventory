class User < ActiveRecord::Base
  has_many :ratings
  has_many :skills, through: :ratings

  belongs_to :section
  validates :role, inclusion: { in: %w(student instructor),
                                message: "%{value} is not a valid role" }
  before_create :generate_token

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
