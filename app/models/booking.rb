class Booking < ApplicationRecord
  enum status: [:pending, :confirmed, :declined], _default: :pending
  belongs_to :workout
  belongs_to :user

  validates :date_time, presence: true
end
