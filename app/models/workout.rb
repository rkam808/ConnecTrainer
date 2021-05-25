class Workout < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # has_many :users, through :bookings
  CATEGORIES = ['Yoga', 'Crossfit', 'Kick-boxing', 'Swimming', 'Jogging', 'badminton', 'volleyball', 'Basketball', 'Football', 'Fitness', 'Zumba', 'Salsa', 'Weight Training']

  validates :category, :location, :name, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
