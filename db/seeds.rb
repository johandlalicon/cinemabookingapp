# admin_user = User.create!(
#   first_name: 'Ippo',
#   last_name: 'Makunouchi',
#   email: 'demsey_roll_allday@kamogawa.com',
#   mobile_number: '123456789',
#   password: 'aaaaaa',
#   password_confirmation: 'aaaaaa',
#   isAdmin: true
# )


cinemas_data = [
    { cinema_number: 1 },
    { cinema_number: 2 },
    { cinema_number: 3 },
    { cinema_number: 4 }
  ]
  Cinema.create!(cinemas_data)
  

  timeslots_data = [
    { start_time: "10:00AM" },
    { start_time: "2:00PM" },
    { start_time: "6:00PM" },
    { start_time: "10:00PM" }
  ]
  
  timeslots_data.each do |data|
    start_time_str = data[:start_time]
    start_time = Time.strptime(start_time_str, "%I:%M%p")
    Timeslot.create(start_time: start_time)
  end

  # Create movies
  movies_data = [
    { title: "Oppenheimer" },
    { title: "Barbie" },
    { title: "Mission: Impossible - Dead Reckoning Part One" },
    { title: "eHeads Event" }
  ]
  movies = Movie.create!(movies_data)
  
  # Associate timeslots with cinemas
  puts "Seed data has been successfully created!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
