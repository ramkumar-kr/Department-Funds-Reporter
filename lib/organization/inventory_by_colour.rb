# Provides inventory for a color
class Organization::InventoryByColour
	attr_reader :result
	def initialize(colour)
		@colour = colour
		@result = 0
	end

	def build(department)
		@result = @result + department.inventory if department.colour == @colour
	end
end