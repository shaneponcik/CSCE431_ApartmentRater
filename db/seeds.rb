# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
    amenities = Amenity.create([{name:"Pool"},{name:"Game Room"},{name:"Lounge"},{name:"Study Area"}])
    metrics = Metric.create([{name:"Transportation"},{name:"Noise"},{name:"Management"},{name:"Location"}])
    tags = Tag.create([{name:"Grad Student Friendly"},{name:"Pets Allowed"},{name:"Responsive Management"},{name:"Onsite Laundry"}])
    users = User.create([{email:"s.poncik@tamu.edu",password:"testpw",verified:true},{email:"cmainard@gmail.com",password:"ex",verified:false}])
    apartments = Apartment.create([{name:"The Stack"},{name:"The Rise"},{name:"Wells Hall"}])
    reviews = Review.create([{apartment_id:1,user_id:1,review_text:"Sample Text"}])
    review_tags = ReviewTag.create([{review_id:1,tag_id:1}])
    review_amenities = ReviewAmenity.create([{review_id:1,amenity_id:1}])
    review_metrics = ReviewMetric.create([{review_id:1,metric_id:1,rating:5}])



