# Represents an administrative division in an organization
class Organization::ManagerialDepartment
	
	def initialize(department_name, sub_departments = [])
		@name = department_name
		@sub_departments = sub_departments
	end

	def cash
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.cash 
		end
	end

	def inventory
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory 
		end
	end
end