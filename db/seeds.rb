# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: "scarv", description: "A scarv for cold days",
	image_url:"https://images.unsplash.com/photo-1491245257527-395e9c480145?auto=format&fit=crop&w=750&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	colour: "Semen", price: 30)

Product.create(name: "Sun Glasses", description: "A glass for every days",
	image_url:"https://images.unsplash.com/photo-1502767089025-6572583495f9?auto=format&fit=crop&w=1500&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	colour: "Black", price: 35)

Product.create(name: "Sandal", description: "Modern sandal for your party",
	image_url:"https://images.unsplash.com/photo-1457647239067-15a2a76c724e?auto=format&fit=crop&w=750&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	colour: "Black", price: 40)

Product.create(name: "Shoes", description: "Modern brown shoes for men",
	image_url:"https://images.unsplash.com/photo-1426649397221-b62c5a7824ee?auto=format&fit=crop&w=780&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	colour: "Brown", price: 40)

Product.create(name: "Bag", description: "Modern brown bag",
	image_url:"https://images.unsplash.com/photo-1473188588951-666fce8e7c68?auto=format&fit=crop&w=840&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	colour: "Brown", price: 35)

Product.create(name: "Jeans", description: "MModern Jeans with different sizes",
	image_url:"https://images.unsplash.com/photo-1454720503269-3a35c21bebc6?auto=format&fit=crop&w=608&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	colour: "Blue", price: 20)