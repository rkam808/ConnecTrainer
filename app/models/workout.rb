class Workout < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # has_many :users, through :bookings
  CATEGORIES = ['Yoga', 'Crossfit', 'Kick-boxing', 'Swimming', 'Jogging', 'badminton', 'volleyball', 'Basketball', 'Football', 'Fitness', 'Zumba', 'Salsa', 'Weight Training']

  CLUBS = ["Team", "Group", "Club"]

  validates :category, :location, :name, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # def Self.categories
  #   Workout.all.uniq do |workout|
  #     if workout.unique
  # end

    include PgSearch::Model
          pg_search_scope :search_by_category_and_location,
            against: [ :category, :location ],
            using: {
              tsearch: { prefix: true } # <-- now `superman batm` will return something!
            }


end
