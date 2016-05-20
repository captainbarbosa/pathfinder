**Pathfinder** is the result of my last two week sprint at The Iron Yard's back-end engineering course.    

It is still in active development so there will be frequent updates.          

The goal of creating Pathfinder was to create a visually appealing, easy to use interface for itinerary planning with a geospatial aspect in mind.    

Pathfinder was created with [Ruby on Rails](https://github.com/rails/rails), [Skeleton](http://getskeleton.com/), [Owen Mead-Robins'](https://github.com/owenmead) fork of [Pikaday](https://github.com/owenmead/Pikaday), and [Mapbox GL JS](https://www.mapbox.com/mapbox-gl-js/api/).


### Try it out

* **On Heroku**:    
   Pathfinder is deployed on Heroku [here](https://fierce-everglades-36360.herokuapp.com/)
   To see an account with populated data, log in with the following credentials:        
   ```
   Username: user@user.com
   Password: password
   ```

* **Through localhost**:    
   If you have Rails installed, you can also download and run it locally by entering    
   `rake db:create`, `rake db:migrate`, and `rails s` within the directory.

### Things that need fixing:    
- [ ] Fix NaN that occurs from distance method in activities view that comes after last activity (ok locally, broken on Heroku)
- [ ] Fix flash messages on new activity
- [ ] Improve time format in datepicker
- [ ] Restyle activities listings
