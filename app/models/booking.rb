class Booking < ApplicationRecord
  enum status: [:pending, :confirmed, :declined]
  belongs_to :workout
  belongs_to :user

  validates :date_time, presence: true
end
