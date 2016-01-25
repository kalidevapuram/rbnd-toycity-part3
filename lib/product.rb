class Product
	attr_reader :title, :price, :stock   #Getting the title,price,stock values
	@@products = [] #creating a products array which holds total number of products 
	
	def initialize(options={}) 
		@title = options[:title]    #Creating a variable title, and assigning value
		@price = options[:price]	#Creating a variable price, and assigning value
		@stock = options[:stock]	#Creating a variable stock, and assigning value
		add_to_products  #It calls add_to_products method 
	end
	
	def self.all  #Method calls the self class
		@@products
	end
	
	def in_stock?  #Method to check products are in stock or not
		if stock >0   #If stock is more than one returns true
			return true
		else
			return false
		end
	end

	def self.in_stock   #Class method to to push products instock into an array
		pro_array =[]    #Creating an empty array
		@@products .each do |product|   #Entering into products loop
			if product.stock > 0
				pro_array << product  #Array only holds the products in stock
			end
		end
		return pro_array   #Returns the pro_array
	end

	
	def self.find_by_title(title)     #Method to find the product through title
		@@products .each do |product|  #Entering into each loop
			if product.title == title   #checks the condition against title
				product.title     #display the product title
				product.price	  #display the product price
				product.stock	  #display the product stock
				return product     #return product 
			end
		end
	end
	
	def update_stock   #After a transaction, it updates the stock value 
		@stock = @stock -1  #Decrease the stock value to one 
	end
	
	def add_stock
		@stock = @stock +1  #Increase the product stock by one after returning a value
	end


	private
	def add_to_products   #this method adds the products into an array
# 	 	@@products.each do |product|   #entering into products array loop
#   		if product.title == @title
#     			raise DuplicateProductError, "'#{@title}' already exists."   #It throws an error and prints the title already exists
#   		end
# 		end
		@@products << self
	end
	

end

