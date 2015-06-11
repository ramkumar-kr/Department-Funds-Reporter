# Represents an administrative division in an organization
class Organization::ManagerialDepartment
	
	def initialize(department_name, sub_departments, categories)
		@name = department_name
		@sub_departments = sub_departments
		@categories = categories
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

	def average_inventory
		inventory / @sub_departments.length
		
	end
end