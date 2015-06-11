require "spec_helper"

describe Organization::ManagerialDepartment do
 
  context 'Get total funds' do
  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do

  		sub_department1 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department2 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department3 = FactoryGirl.build(:procurement_department, cash: 10000)
  		department = FactoryGirl.build(:managerial_department, sub_departments:  [sub_department1, sub_department2, sub_department3])
  		expect(department.cash).to eq(30000.0)
  	end	

  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department2 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department3 = FactoryGirl.build(:procurement_department, cash: 10000)
  		department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
  		department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
  		expect(department2.cash).to eq(30000.0)
  	end	
  end   

  context 'Inventory' do
    it "should return remaining inventory of a Department as a sum of inventory in each of it's sub departments" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 200)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 200)
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 200)
      department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      expect(department.inventory).to eq(600)
    end 

    it "should return total remaining inventory of a Department as a sum of inventory in each of it's sub departments" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 300)
      department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
      expect(department2.inventory).to eq(900)
    end 

    it "should return the average remaining inventory as 250 for sub departments having inventory 300 and 200 where both are procurement departments" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 200)
      department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      expect(department.average_inventory).to eq(250)
    end

    it "should return the average remaining inventory as 250 for sub departments having inventory 300 and 200 wherein the latter is a managerial department" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 100)
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 100)
      sub_department4 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department2, sub_department3])
      department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department4])
      expect(department.average_inventory).to eq(250)
    end

    context 'Category' do
      it "should return inventory of black clothes as 100 for sub departments having black clothes where all are procurement departments" do
        sub_department1 = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
        sub_department2 = FactoryGirl.build(:procurement_department, inventory: 60, categories: {"colour" => "black"})
        department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
        expect(department.inventory_by_category("colour","black")).to eq(100)
      end

      it "should return inventory of black clothes as 200 for sub departments having black clothes where some departments are managerial and some are procurement" do
        sub_department1 = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
        sub_department2 = FactoryGirl.build(:procurement_department, inventory: 60, categories: {"colour" => "black"})
        sub_department3 = FactoryGirl.build(:procurement_department, inventory: 100, categories: {"colour" => "black"})
        sub_department4 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department2, sub_department3])
        department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department4])
        expect(department.inventory_by_category("colour","black")).to eq(200)
      end

      it "should return inventory of black clothes as 140 for sub departments where one of them has white clothes" do
        sub_department1 = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
        sub_department2 = FactoryGirl.build(:procurement_department, inventory: 60, categories: {"colour" => "white"})
        sub_department3 = FactoryGirl.build(:procurement_department, inventory: 100, categories: {"colour" => "black"})
        sub_department4 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department2, sub_department3])
        department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department4])
        expect(department.inventory_by_category("colour","black")).to eq(140)
      end

      it "should return inventory of black clothes as 40 for sub departments where one of them do not have a colour category" do
        sub_department1 = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
        sub_department2 = FactoryGirl.build(:procurement_department, inventory: 60, categories: {"colour" => "white"})
        sub_department3 = FactoryGirl.build(:procurement_department, inventory: 100)
        sub_department4 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department2, sub_department3])
        department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department4])
        expect(department.inventory_by_category("colour","black")).to eq(40)
      end
    end
  end   


end