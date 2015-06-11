require "spec_helper"

describe Organization::ManagerialDepartment do
 
  context 'Get total funds' do
  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = Organization::ProcurementDepartment.new("Finance_Delhi", 10000,100)
  		sub_department2 = Organization::ProcurementDepartment.new("Finance_Indore", 10000, 100)
  		sub_department3 = Organization::ProcurementDepartment.new("Finance_Mumbai", 10000, 100)
  		department = Organization::ManagerialDepartment.new("Finance", [sub_department1, sub_department2, sub_department3])
  		expect(department.cash).to eq(30000.0)
  	end	

  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = Organization::ProcurementDepartment.new("Finance_Delhi", 10000, 100)
  		sub_department2 = Organization::ProcurementDepartment.new("Finance_Indore", 10000, 100)
  		sub_department3 = Organization::ProcurementDepartment.new("Finance_Mumbai", 10000, 100)
  		department1 = Organization::ManagerialDepartment.new("Finance", [sub_department1, sub_department2])
  		department2 = Organization::ManagerialDepartment.new("Finance", [sub_department3, department1])
  		expect(department2.cash).to eq(30000.0)
  	end	
  end   

  context 'Inventory' do
    it "should return remaining inventory of a Department as a sum of inventory in each of it's sub departments" do
      sub_department1 = Organization::ProcurementDepartment.new("Finance_Delhi", 10000, 200)
      sub_department2 = Organization::ProcurementDepartment.new("Finance_Indore", 10000, 200)
      sub_department3 = Organization::ProcurementDepartment.new("Finance_Mumbai", 10000, 200)
      department = Organization::ManagerialDepartment.new("Finance", [sub_department1, sub_department2, sub_department3])
      expect(department.inventory).to eq(600)
    end 

    it "should return total remaining inventory of a Department as a sum of inventory in each of it's sub departments" do
      sub_department1 = Organization::ProcurementDepartment.new("Finance_Delhi", 10000, 300)
      sub_department2 = Organization::ProcurementDepartment.new("Finance_Indore", 10000, 300)
      sub_department3 = Organization::ProcurementDepartment.new("Finance_Mumbai", 10000, 300)
      department1 = Organization::ManagerialDepartment.new("Finance", [sub_department1, sub_department2])
      department2 = Organization::ManagerialDepartment.new("Finance", [sub_department3, department1])
      expect(department2.inventory).to eq(900)
    end 
  end   
end