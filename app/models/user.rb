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
  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  									format: { with: VALID_EMAIL_REGEX },
  									uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end

# Generated with the command:
# $ rails generate model User name:string email:string
# Note: Modelss use a singular context 'User' whereas the
# controller uses plural 'Users'

# attr_accessible means accessible attributes, aka attributes
# which can be modified by outside users
