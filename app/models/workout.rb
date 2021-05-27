class Workout < ApplicationRecord
  belongs_to :user
  has_many :bookings

  CLUBS = ["Team", "Group", "Club"]

  validates :category, :location, :name, :price, presence: true
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
