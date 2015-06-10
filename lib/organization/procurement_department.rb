#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash
	def initialize(name, funds)
		@name = name
		@cash = funds
	end
end