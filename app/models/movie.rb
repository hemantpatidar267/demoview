class Movie < ApplicationRecord
  has_many :screens
  belongs_to :user
  has_many :tickets
  has_many :theatres, through: :screens




end
