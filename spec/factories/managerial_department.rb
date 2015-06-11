FactoryGirl.define do
	factory :managerial_department, class: Organization::ManagerialDepartment do
		name "Untitled"
		sub_departments []
		categories {}
		initialize_with { new(name, sub_departments, categories) }
	end
end