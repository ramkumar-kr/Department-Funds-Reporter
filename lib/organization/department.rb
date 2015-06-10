# Represents a division in an organization
class Organization::Department
	attr_reader :name, :total_funds, :sub_departments
	def initialize(department_name, total_funds = 0.0, sub_departments = [])
		@name = department_name
		@total_funds = total_funds
		@sub_departments = sub_departments
	end

	def ==(other_object)
		return false unless self.class == other_object.class
		self.name == other_object.name && self.total_funds == other_object.total_funds && self.sub_departments == other_object.sub_departments
	end

	def hash
		[name, total_funds].hash
	end
	
	alias :eql? :==

	def get_cash
		sum = 0.0
		if @sub_departments.length == 0
			return @total_funds
		end
		@sub_departments.each { |e| sum = sum + e.get_cash  }
		sum
	end
	
end