class Workout < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # has_many :users, through :bookings
  CATEGORIES = ['Yoga', 'Crossfit', 'Kick-boxing', 'Swimming', 'Jogging', 'badminton', 'volleyball', 'Basketball', 'Football', 'Fitness', 'Zumba', 'Salsa', 'Weight Training']

  validates :category, :location, :name, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # def Self.categories
  #   Workout.all.uniq do |workout|
  #     if workout.unique
  # end

end
