class User < ApplicationRecord
  has_many :theatres, dependent: :destroy

  has_many :movies

  has_many :tickets, dependent: :destroy

  has_many :screens, through: :theatres
  #has_secure_password
  validates :name, presence: true, format: { without: /\d/ }
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}, on: :create
  validates :password , presence: true
  validates :role, presence: true

end
