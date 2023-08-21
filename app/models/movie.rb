class Movie < ApplicationRecord
  has_many :screens
  belongs_to :theatres
  belongs_to :user, dependent: :destroy
  has_many :tickets
  has_many :theatres, through: :screens

  validates :name , presence: true
  validates :start_date , presence: true
  validates :end_date , presence: true



end
