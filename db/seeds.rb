# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ----------- User -----------
@user = User.create(email: 'user@user.com', password: 'password')

# ----------- Trips ----------
@sfo = Trip.create(user_id: @user.id, name: 'San Francisco', description: 'Family trip to Silicon Valley')
@mco = Trip.create(user_id: @user.id, name: 'Orlando', description: 'The house of mouse')
@sea = Trip.create(user_id: @user.id, name: 'Seattle', description: 'A visit to the Emerald City')

# -------- Activities --------

  # -- SFO --
@sfo_1 = Activity.create(trip_id: @sfo.id, name: 'Mission Beach Cafe', date: '2016/06/01', description: 'Best brunch in town, but no reservations accepted.', address: '198 Guerrero St, San Francisco, CA 94103')
@sfo_2 = Activity.create(trip_id: @sfo.id, name: 'Coit Tower', date: '2016/06/01', description: 'Sweeping views of the city!', address: '1 Telegraph Hill Blvd, San Francisco, CA 94133')
@sfo_3 = Activity.create(trip_id: @sfo.id, name: 'Japanese Tea Garden', date: '2016/06/02', description: 'A unique tea garden tucked away within Golden Gate Park. Entrance fee $8.00 for non-residents, but free if arriving before 10am.', address: 'Tea Garden Dr, San Francisco, CA 94102')

  # -- MCO --
@mco_1 = Activity.create(trip_id: @mco.id, name: 'Epcot', date: '2016/07/01', description: 'Disney World\'s most futuristic park that you can openly drink within.', address: '200 Epcot Center Dr, Orlando, FL 32821')
@mco_2 = Activity.create(trip_id: @mco.id, name: 'Orlando Science Center', date: '2016/07/02', description: 'Hands on exhibits, shows, and a planetarium.', address: '777 E Princeton St, Orlando, FL 32803')
@mco_3 = Activity.create(trip_id: @mco.id, name: 'Scenic Boat Tour', date: '2016/07/02', description: 'Relaxing boat ride through Winter Park\'s interconnected lakes.', address: '312 E Morse Blvd, Winter Park, FL 32789')

  # -- SEA --
@sea_1 = Activity.create(trip_id: @sea.id, name: 'EMP Museum', date: '2016/08/02', description: 'Sweet pop-culture museum founded by Microsoft co-founder Paul Allen', address: '325 5th Ave N, Seattle, WA 98109')
@sea_2 = Activity.create(trip_id: @sea.id, name: 'Seattle Central Library', date: '2016/08/03', description: 'Flagship library of The Seattle Public Library system built by renowned architects Rem Koolhaas and Joshua Prince-Ramus', address: '1000 4th Ave, Seattle, WA 98104')
@sea_3 = Activity.create(trip_id: @sea.id, name: 'Chihuly Garden and Glass', date: '2016/08/04', description: 'Exhibit in the Seattle Center showcasing the studio glass of Dale Chihuly.', address: '305 Harrison St, Seattle, WA 98109')
