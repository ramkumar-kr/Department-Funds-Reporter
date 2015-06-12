# Provides inventory for a color
class Organization::AverageInventoryByColour
	def initialize(colour)
		@colour = colour
		@total = 0
		@count = 0
	end

	def build(department)
		if department.colour == @colour
			@total = @total + department.inventory
			@count = @count + 1
		end
	end

	def result
		return 0 if @count == 0
		@total / @count
	end
end