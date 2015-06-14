# Provides inventory for a color
class Organization::InventoryByColourVisitor
	def initialize(colour)
		@colour = colour
		@total = 0
		@count = 0
	end

	def visit(visitor)
		if visitor.colour == @colour
			@total = @total + visitor.inventory
			@count = @count + 1
		end
	end

	def average
		return 0 if @count == 0
		@total / @count
	end

	def result
		@total
	end
end