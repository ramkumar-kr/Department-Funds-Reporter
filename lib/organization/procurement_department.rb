#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory
	def initialize(name, cash, inventory, categories)
		@name = name
		@cash = cash
		@inventory = inventory
		@categories = categories
	end
	def inventory_by_category(category, property)
		if @categories && @categories[category] == property 
			@inventory
		else
			0
		end			
	end
end