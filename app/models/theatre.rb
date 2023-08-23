class Theatre < ApplicationRecord
  has_many :screens
  has_many :movies ,through: :screen
  has_many :tickets
  belongs_to :user


  validates :name , presence: true
  validates :address , presence: true
end
