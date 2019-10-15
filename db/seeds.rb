# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
    amenities = Amenity.create(
        [
            {name:"Pool"},
            {name:"Game Room"},
            {name:"Lounge"},
            {name:"Study Area"},
            {name: "Pet Park"}])

    metrics = Metric.create(
        [
            {name:"Transportation"},
            {name:"Noise"},
            {name:"Management"},
            {name:"Location"},
            {name:"Amenities"}])

    tags = Tag.create(
        [
            {name:"Grad Student Friendly"},
            {name:"Pets Allowed"},
            {name:"Responsive Management"},
            {name:"Onsite Laundry"},
            {name:"Has Bus Route"}])

    users = User.create(
        [
            {email:"s.poncik@tamu.edu",password:"testpw",verified:true},
            {email:"cmainard@gmail.com",password:"ex",verified:false},
            {email: "jhann@blinn.edu", password:"jhann", verified:true}])

    apartments = Apartment.create(
        [
            {name:"The Stack"},
            {name:"The Rise"},
            {name:"Wells Hall"},
            {name:"The Wick"},
            {name:"Campus Village"}])

    reviews = Review.create(
        [
            {apartment_id:1,user_id:1,review_text:"Sample Text"},
            {apartment_id:3,user_id:3,review_text:"I loved this place!"}])
        review_tags = ReviewTag.create(
            [
                {review_id:1,tag_id:1},
                {review_id:1,tag_id:3},
                {review_id:2,tag_id:4},
                {review_id:2,tag_id:2}])
        review_amenities = ReviewAmenity.create(
            [
                {review_id:1,amenity_id:1},
                {review_id:1,amenity_id:4}])
        review_metrics = ReviewMetric.create(
            [
                {review_id:1,metric_id:1,rating:5},
                {review_id:1,metric_id:2,rating: 2}])
                {review_id:2,metric_id:3,rating: 4}



