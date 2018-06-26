class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :songs, through: :adds
  has_many :adds

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: email_regex }, uniqueness: { case_sensitive: false }, confirmation: true
  validates :password, length: { minimum: 5 }, allow_nil: true
end
