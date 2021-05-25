require 'faker'
require 'date'

puts 'clearing database'
Booking.destroy_all
Workout.destroy_all
User.destroy_all
puts 'Creating Users & Workouts'
locations = ['Tokyo', 'Omotesando', 'Yokohama', 'Fujisawa', 'Saitama', 'Setagaya', 'Ueno', 'Meguro', 'Shibuya', 'Shinagawa', 'Kanda', 'Shinjuku', 'Mitaka']
today = DateTime.now

10.times do
  example = User.create!(
    name:  Faker::Name.name,
    location: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  1.times do
    example_workout = Workout.create!(
    category: Workout::CATEGORIES.sample,
    location: locations.sample,
    name: Faker::Verb.ing_form,
    user_id: example.id
  )
  1.times do
    Booking.create!(
    date_time: today,
    comment: Faker::Lorem.sentence(word_count: 6),
    status: (0..2).to_a.sample,
    user_id: example.id,
    workout_id: example_workout.id
  )
  end
  end
end
