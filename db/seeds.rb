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


  2.times do
    category = Workout::CATEGORIES.sample
    example_workout = Workout.create!(
    category: category,
    location: locations.sample,
    name:   ("#{Faker::Verb.ing_form} #{category}").capitalize,
    user_id: example.id,
    description: Faker::Quote.matz,
    price: (rand(1..4).to_s + "000").to_i
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
