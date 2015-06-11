#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory
	def initialize(name, cash, inventory)
		@name = name
		@cash = cash
		@inventory = inventory
	end
end