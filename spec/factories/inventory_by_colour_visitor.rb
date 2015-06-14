FactoryGirl.define do
	factory :inventory_by_colour, class: Organization::InventoryByColourVisitor do
		colour "none"
		initialize_with { new(colour) }
	end
end