require 'faker'
require 'date'

puts 'clearing database'
Booking.destroy_all
Workout.destroy_all
User.destroy_all
puts 'Creating Users & Workouts'
locations = ['Omotesando', 'Yokohama', 'Fujisawa', 'Saitama', 'Setagaya', 'Ueno', 'Meguro', 'Shibuya', 'Shinagawa', 'Kanda', 'Shinjuku', 'Mitaka']
categories = ['Yoga', 'Crossfit', 'Kick-boxing', 'Swimming', 'Jogging', 'badminton', 'volleyball', 'Basketball', 'Football', 'Fitness', 'Zumba', 'Salsa', 'Weight Training']
today = DateTime.now

10.times do
  example = User.create!(
    name:  Faker::Name.first_name + " " + Faker::Name.last_name,
    location: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    bio: Faker::Company.industry
  )

  2.times do
    location = locations.sample
    club = Workout::CLUBS.sample
    category = categories.sample
    example_workout = Workout.create!(
    category: category,
    location: ("#{location}, Tokyo"),
    name:   ("#{location} Badminton #{club}"),
    user_id: example.id,
    description: Faker::Quote.matz,
    price: (rand(5..10).to_s + "00").to_i
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
