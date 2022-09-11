class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/restaurants" do
    restaurants = Restaurant.all
    restaurants.to_json
  end

  get '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])

    restaurant.to_json(only: [:id, :name, :cuisine, :price_range, :image, :location, :website], include: {
      reviews: {only: [:description, :rating], include: {
        user: {only: [:name]}
      }}
    })
  end

  get '/reviews' do
    #restaurant = Restaurant.find(params[:id])

    review = Review.all
    review.to_json
  end

  get '/reviews/:id' do
    review = Review.find(params[:id])
    review.to_json
  end

  delete '/reviews/:id' do
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end

  post '/reviews' do
    review = Review.create(
    description: params[:description],
    rating: params[:rating],
    restaurant_id: params[:restaurant_id],
    user_id: params[:user_id]
  )
  review.to_json
  end

  patch '/reviews/:id' do
    review = Review.find(params[:id])
    review.update(
      description: params[:description],
      rating: params[:rating]
    )
    review.to_json
  end


end
