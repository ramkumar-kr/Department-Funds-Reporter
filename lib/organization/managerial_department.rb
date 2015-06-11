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

	def inventory_by_colour(colour)
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_by_colour(colour)
		end
	end

	def inventory_of_black_and_not_jeans_or_t_shirts
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_of_black_and_not_jeans_or_t_shirts
		end
	end

	def inventory_of_men_t_shirts_or_women_scarfs
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_of_men_t_shirts_or_women_scarfs
		end
	end


end