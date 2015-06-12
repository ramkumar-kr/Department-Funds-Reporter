require "spec_helper"

describe Organization::AverageInventoryByColour do
  context 'Generate Report for procurement department' do
    it "should return inventory of black clothes as 40" do
      department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
      average_inventory_by_colour = FactoryGirl.build(:average_inventory_by_colour, colour: "black")
      department.generate_report(average_inventory_by_colour)
      expect(average_inventory_by_colour.result).to eq(40)
    end

    it "should return inventory of black clothes as 0" do
      department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "white"})
      average_inventory_by_colour = FactoryGirl.build(:average_inventory_by_colour, colour: "black")
      department.generate_report(average_inventory_by_colour)
      expect(average_inventory_by_colour.result).to eq(0)
    end

    it "should return inventory of black clothes as 0 when it does not deal with colour" do
      department = FactoryGirl.build(:procurement_department)
      average_inventory_by_colour = FactoryGirl.build(:average_inventory_by_colour)
      department.generate_report(average_inventory_by_colour)
      expect(average_inventory_by_colour.result).to eq(0)
    end
  end

  context 'Generate Report for a combination of Managerial and Procurement Departments' do
    it "should return inventory of black clothes as 100 for sub departments having black clothes where all are procurement departments" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 60, categories: {"colour" => "black"})
      department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      average_inventory_by_colour = FactoryGirl.build(:average_inventory_by_colour, colour:"black")
      department.generate_report(average_inventory_by_colour)
      expect(average_inventory_by_colour.result).to eq(50)
    end

    it "should return inventory of black clothes as 200 for sub departments having black clothes where some departments are managerial and some are procurement" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 60, categories: {"colour" => "black"})
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 100, categories: {"colour" => "black"})
      sub_department4 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department2, sub_department3], categories: {"colour" => "black"})
      department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department4])
      average_inventory_by_colour = FactoryGirl.build(:average_inventory_by_colour, colour:"black")
      department.generate_report(average_inventory_by_colour)
      expect(average_inventory_by_colour.result).to eq(66)
    end

    it "should return inventory of black clothes as 200 for sub departments having black clothes where some departments are managerial and some are procurement" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 60, categories: {"colour" => "black"})
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 100, categories: {"colour" => "white"})
      sub_department4 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department2, sub_department3], categories: {"colour" => "black"})
      department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department4])
      average_inventory_by_colour = FactoryGirl.build(:average_inventory_by_colour, colour:"black")
      department.generate_report(average_inventory_by_colour)
      expect(average_inventory_by_colour.result).to eq(50)
    end
  end
end