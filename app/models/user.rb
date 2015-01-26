class User < ActiveRecord::Base
  belongs_to :group
  validates :role, inclusion: { in: %w(student instructor),
    message: "%{value} is not a valid role" }

  before_create :generate_token

  def student?
    role == "student"
  end

  def instructor?
    role == "instructor"
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
