FactoryGirl.define do
	factory :inventory_by_colour, class: Organization::InventoryByColour do
		colour "none"
		initialize_with { new(colour) }
	end
end