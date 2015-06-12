FactoryGirl.define do
	factory :inventory_by_colour, class: Organization::InventoryByColour do
		colour "none"
		department FactoryGirl.build(:procurement_department)
		initialize_with { new(colour, department) }
	end
end