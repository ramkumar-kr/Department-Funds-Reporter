require "spec_helper"

describe Organization::InventoryByColour do
  context 'Generate Report' do
    it "should return inventory of black clothes as 40" do
      department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
      inventory_by_colour = FactoryGirl.build(:inventory_by_colour, colour: "black", department: department)
      expect(inventory_by_colour.generate_report).to eq(40)
    end

    it "should return inventory of black clothes as 0" do
      department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "white"})
      inventory_by_colour = FactoryGirl.build(:inventory_by_colour, colour: "black", department: department)
      expect(inventory_by_colour.generate_report).to eq(0)
    end

    it "should return inventory of black clothes as 0 when it does not deal with colour" do
      department = FactoryGirl.build(:procurement_department)
      inventory_by_colour = FactoryGirl.build(:inventory_by_colour, department:department)
      expect(inventory_by_colour.generate_report).to eq(0)
    end
  end
end