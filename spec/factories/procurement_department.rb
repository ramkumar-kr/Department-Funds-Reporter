FactoryGirl.define do
	factory :procurement_department, class: Organization::ProcurementDepartment do
		name "Untitled"
		cash 0
		inventory 0
		categories {}
		initialize_with { new(name, cash, inventory, categories) }
	end
end