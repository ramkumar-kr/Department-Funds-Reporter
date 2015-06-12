FactoryGirl.define do
	factory :average_inventory_by_colour, class: Organization::AverageInventoryByColour do
		colour "none"
		initialize_with { new(colour) }
	end
end