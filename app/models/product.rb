class Product < ApplicationRecord
	has_many :orders



	def self.search(search_term)
    	search_term.strip! #Returns a copy of str with leading and trailing whitespace removed.
    	if (Rails.env.development? || Rails.env.test?)
      		Product.where('name LIKE ?', "%#{search_term}%")
    	else
      		Product.where('name ilike ?', "%#{search_term}%")
    	end
	end

end
