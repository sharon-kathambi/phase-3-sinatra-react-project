puts "🌱 Seeding spices..."

# Seed your database here
#Make 10 users
10.times do
    User.create(name: Faker::Name.name)
end

#Make 6 restaurants
Restaurant.create(name: "Bambino", cuisine: "Italian", price_range: "Ksh 1500 - 3500", location: "Westlands", image: "/home/sharon/Development/code/phase-3/phase-3-sinatra-react-project/public/images/bambino.jpg" ,website:"https://www.thefoodlibrary.co.ke/bambino/")
Restaurant.create(name: "INTI", cuisine: "Japanese-Peruvian", price_range: "Ksh 3500 - 6000", location: "Westlands", image: "public/images/inti.jpeg", website: "https://www.thefoodlibrary.co.ke/inti/")
Restaurant.create(name: "Chekafe", cuisine: "Japanese", price_range: "Ksh 1500 - 2500", location: "Lavington", image: "public/images/chekafe.jpeg", website: "https://www.instagram.com/chekafe/?hl=en")
Restaurant.create(name: "Chophouse", cuisine: "Continental", price_range: "Ksh 3500 - 6000", location: "Upperhill", image: "public/images/chophouse.jpeg", website: "https://chophouse.ke/")
Restaurant.create(name: "Hero", cuisine: "Seafood", price_range: "Ksh 1500 - 4000", location: "Gigiri", image: "public/images/hero.jpeg", website: "https://www.hero-kenya.com/")
Restaurant.create(name: "Cultiva", cuisine: "Continental", price_range: "Ksh 2500 - 5000", location: "Karen", image: "public/images/cultiva.jpeg", website: "https://eatout.co.ke/nairobi/cultiva/")

#create between 1 and 5 reviews for each restaurant
rand(1..5).times do
 Restaurant.all.each do |restaurant|
    
    user = User.order('RANDOM()').first

    Review.create(
        rating: rand(1..5),
        description: Faker::Restaurant.review,
        restaurant_id: restaurant.id,
        user_id: user.id
    )
    end
end

puts "✅ Done seeding!" 
