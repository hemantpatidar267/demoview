class Movie < ApplicationRecord
  has_many :theatres, through: :screens
  has_many :screens, dependent: :destroy
  has_many :tickets, dependent: :destroy
  belongs_to :user

   has_one_attached :image

  # validates :name , presence: true
  # validates :start_date , presence: true
  # validates :end_date , presence: true



end
