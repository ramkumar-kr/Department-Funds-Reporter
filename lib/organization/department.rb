# Represents a division in an organization
class Organization::Department
	attr_reader :name, :total_funds
	def initialize(department_name, total_funds)
		@name = department_name
		@total_funds = total_funds
	end

	def ==(other_object)
		return false unless self.class == other_object.class
		self.name == other_object.name && self.total_funds == other_object.total_funds
	end

	def hash
		[name, total_funds].hash
	end

	alias :eql? :==
	
end