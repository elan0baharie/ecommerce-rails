Product.destroy_all


50.times do |index|
  Product.create!(
            name: Faker::Food.ingredient,
            price: 3.25
  )
end

p "Created #{Product.count} products"
