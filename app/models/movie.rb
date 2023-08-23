class Movie < ApplicationRecord
  has_many :theatres, through: :screens
  has_many :screens
  has_many :tickets
  belongs_to :user


  validates :name , presence: true
  validates :start_date , presence: true
  validates :end_date , presence: true



end
