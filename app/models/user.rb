class User < ActiveRecord::Base
  has_secure_password
  has_many :pets

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  # Using this instead of gem 'validates_email_format_of'
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, length: { minimum: 7 }
  validates_confirmation_of :password

  GENDER_TYPES = [" ","Other/Not Provided","Male", "Female"]

end
