# Provides inventory for a color
class Organization::InventoryByColour
	def initialize(colour, department)
		@colour = colour
		@department = department
	end

	def generate_report
		return 0 unless @department.colour_category_exists?(@colour)
		@department.inventory
	end
end