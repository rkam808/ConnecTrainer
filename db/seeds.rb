require 'faker'

puts 'clearing database'
Booking.destroy_all
Workout.destroy_all
User.destroy_all
puts 'Creating Users & Workouts'

10.times do
  example = User.create!(
    name:  Faker::Name.name,
    location: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  1.times do
    Workout.create!(
    category: Workout::CATEGORIES.sample,
    location: Faker::Address.street_address,
    name: Faker::Verb.ing_form,
    user_id: example.id
  )
  end
end
