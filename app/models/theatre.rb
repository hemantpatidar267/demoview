class Theatre < ApplicationRecord
  has_many :screens,  dependent: :destroy
  has_many :movies ,through: :screen
  has_many :tickets, dependent: :destroy
  belongs_to :user


  validates :name , presence: true
  validates :address , presence: true
end
