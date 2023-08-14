class Theatre < ApplicationRecord
  belongs_to :user
  has_many :screens
  has_many :tickets
  has_many :movies ,through: :screen

  validates :name , presence: true
  validates :address , presence: true
end
