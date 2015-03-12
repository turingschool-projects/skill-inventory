class User < ActiveRecord::Base
  has_many :ratings
  has_many :skills, through: :ratings

  belongs_to :cohort
  validates :role, inclusion: { in: %w(student instructor),
                                message: "%{value} is not a valid role" }
  validates :uid, :provider, :username, :thumbnail_url, presence: true
  validates :uid, uniqueness: true

  before_create :generate_token

  def self.create_with_github(auth)
    create! do |user|
      user.provider = "github"
      user.uid = auth[:id]
      user.name = auth[:name]
      user.username = auth[:login]
      user.thumbnail_url = auth[:avatar_url]
      user.email = auth[:email]
    end
  end

  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
