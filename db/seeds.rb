# cinemas_data = [
#     { cinema_number: 1 },
#     { cinema_number: 2 },
#     { cinema_number: 3 },
#     { cinema_number: 4 }
#   ]
#   Cinema.create!(cinemas_data)
  
  # Create predefined timeslots
  timeslots_data = [
    { start_time: "10:00 AM" },
    { start_time: "2:00 PM" },
    { start_time: "6:00 PM" },
    { start_time: "10:00 PM" }
  ]
  timeslots = Timeslot.create!(timeslots_data)
  
  # Create movies
  # movies_data = [
  #   { title: "Movie 1" },
  #   { title: "Movie 2" },
  #   { title: "Movie 3" },
  #   { title: "Movie 4" }
  # ]
  # movies = Movie.create!(movies_data)
  
  # Associate timeslots with cinemas
  puts "Seed data has been successfully created!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
