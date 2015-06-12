# Provides inventory for a color
class Organization::InventoryByColour
	def initialize(colour, department)
		@colour = colour
		@department = department
	end

	def generate_report
		return 0 unless @department.categories && @department.categories["colour"] == @colour
		@department.inventory
	end
end