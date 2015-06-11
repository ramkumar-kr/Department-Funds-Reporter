FactoryGirl.define do
	factory :managerial_department, class: Organization::ManagerialDepartment do
		name "Untitled"
		sub_departments []
		initialize_with { new(name, sub_departments) }
	end
end