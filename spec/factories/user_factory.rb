FactoryBot.define do

  sequence "email" do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email 
    password "1234567890"
    first_name "Ibtesam"
    last_name "Dhair"
    admin false
  end

  factory :admin, class: User do
  	email
	password "qwertyuiop"
	admin true
	first_name "Admin"
	last_name "User"
  end

end