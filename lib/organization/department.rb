# Represents a division in an organization
class Organization::Department
	
	def initialize(department_name, total_funds = 0.0, sub_departments = [])
		@name = department_name
		@total_funds = total_funds
		@sub_departments = sub_departments
	end
	def get_cash
		sum = 0.0
		if @sub_departments.length == 0
			return @total_funds
		end
		@sub_departments.each { |e| sum = sum + e.get_cash  }
		sum
	end
	
end