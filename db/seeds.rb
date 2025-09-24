# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require("bigdecimal/util")

48.times do
  # get and store unique name for product
  product_name = Faker::Commerce.unique.product_name

  # prevent duplicate seeds
  Product.find_or_create_by!(
    name: product_name,
    # ensure Faker returns bigdecimal value (as price returns float) 
    price: Faker::Commerce.price(as_string: false).to_d,
    qty: rand(1..100),
    # generate lipsum sentence with random 10-30 words length
    desc: Faker::Lorem.sentence(word_count: rand(10..30)),
    # fetch random picsum img using unique product name as seed
    image_url: "https://picsum.photos/seed/#{product_name}/600/400",
    # randomly set item as featured
    is_featured: rand <= 0.1
  )
end

# clear UniqueGenerator to preserve future seeds
Faker::UniqueGenerator.clear