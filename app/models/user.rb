class User < ApplicationRecord
  PASSWORD_FORMAT = /\A (?=.{8,25})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :login, presence: true, uniqueness: true, length: { minimum: 6}
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_FORMAT}
  validates :password, presence: true, format: PASSWORD_FORMAT, :on => :create
  validates :password, allow_blank: true, format: PASSWORD_FORMAT, :on => :update
  has_secure_password
end
