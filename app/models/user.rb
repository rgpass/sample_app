# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# The information above was inputted with the Annotate gem
# which provides useful information about the model's data
# To update this, run the command:
# $ bundle exec annotate

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  attr_protected :admin
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  # before_save { |user| user.email = email.downcase }
  before_save { email.downcase! }

  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  									format: { with: VALID_EMAIL_REGEX },
  									uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 } # Because of password digest
  # you do not need presence: true
  validates :password_confirmation, presence: true

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

# Generated with the command:
# $ rails generate model User name:string email:string
# Note: Modelss use a singular context 'User' whereas the
# controller uses plural 'Users'

# attr_accessible means accessible attributes, aka attributes
# which can be modified by outside users
