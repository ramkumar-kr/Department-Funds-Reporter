#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory
	def initialize(name, funds, inventory)
		@name = name
		@cash = funds
		@inventory = inventory
	end
end