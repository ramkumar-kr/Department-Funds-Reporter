FactoryGirl.define do
	factory :managerial, class: Organization::ManagerialDepartment do
		name "Untitled"
		sub_departments []
	end
end