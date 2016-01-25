class Customer

	attr_reader :name

	@@customers = []  #Creates any empty array to store the customer name

	def initialize(options={})  
		@name = options[:name]  #Creating a variable name, and assigning a value
		add_to_customers  #calls add_to_customers private method
	end

	def self.all  #class method to store customer information
		@@customers
	end

	def self.find_by_name(name)  #calls method to find the customer by name
		@@customers .each do |customer|  #entering into customers loop
			if customer.name == name
				customer.name		#prints the customer name
				return customer   #returns the customer name
			end
		end
	end 

	def purchase(product)   #method to create new transaction object
		if product.stock > 0
			transaction = Transaction.new(name,product)
		# else
# 			raise OutOfStockError, "'#{product.title}' is out of stock."
		end
		
		return product   #returns product and transaction
		return transaction
	end


	def returns(product)  #method returns the product and update the stock
		product.add_stock  
	end

	def exchange(product, ex_product)  #This method makes an exchange and updates product and ex_product stock
		product.add_stock
		transaction = Transaction.new(name,ex_product)  #makes a new transaction after returning an old product
	end 

	private
	def add_to_customers
	
		@@customers << self
		#@@customers.each do |customer|   #entering into customers array loop
#   		if customer.name == @name
#     			raise DuplicateCustomerError, "'#{@name}' already exists."   #It throws an error and prints the name already exists
#     		else
#     			@@customers << self
#   		end
# 		end
	end

end




















