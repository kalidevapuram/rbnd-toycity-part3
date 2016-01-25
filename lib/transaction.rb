class Transaction
	attr_reader :id, :purchase_date  #Getter method, id tells info about how many transactions happend
	@@id = 1	#class variable initilising to one
	@@transactions = []  #class variable array count the number of transactions
	
	def initialize(customer,product)  #Initilise method takes customer name and product
		@purchase_date = Time.now.strftime("%d/%m/%Y")  #shows the purchase date of transaction
		@id = @@id   #Assigning calss variable to instance variable
    	@@id += 1  #Incrementing the class variable to one
		@customer = customer
		@product = product
		add_to_transactions   #calls the method add_to_transactions
		product.update_stock   #It calls the update stock method
	end

	def self.all #class method all counts the number of transactions
		@@transactions
	end 

	def product
		return @product  # returns the product
	end

	def customer
		return @customer #should return customer
	end

	def self.find(transaction)  #class mthod
		@@transactions .each do|trans| # Each loop on transaction array and trans is single transaction 
			return trans #returns true if the product is trans
		end
	end 
	
	private
	def add_to_transactions
		@@transactions << self  #pushes every transaction into an array
	end


end