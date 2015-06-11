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

	def inventory_excluded_by_category(category, property)
		if @categories && @categories[category] == property 
			0
		else
			@inventory
		end			
	end

	def inventory_by_categories(categories_included1, categories_excluded1, categories_excluded2)
		
		if @categories && @categories[categories_included1[0]] == categories_included1[1] && 	@categories[categories_excluded1[0]] != categories_excluded1[1] && @categories[categories_excluded2[0]] != categories_excluded2[1]
			@inventory
		else
			0
		end			
	end
end