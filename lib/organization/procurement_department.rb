#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory
	def initialize(name, cash, inventory, categories)
		@name = name
		@cash = cash
		@inventory = inventory
		@categories = categories
	end

	def inventory_by_colour(colour)
		if @categories && @categories["colour"] == colour
			@inventory
		else
			0
		end
	end

	def inventory_of_black_and_not_jeans_or_t_shirts
		if @categories && @categories["colour"] == "black" && @categories["garment_subtype"] != "jeans" && @categories["garment_subtype"] != "t_shirt"
			@inventory
		else
			0
		end
	end


def inventory_of_men_t_shirts_or_women_scarfs
		if @categories && ( (@categories["gender"] == "men" && @categories["garment_subtype"] == "t_shirt") || (@categories["gender"] == "women" && @categories["garment_subtype"] == "scarf") )
			@inventory
		else
			0
		end
	end


end