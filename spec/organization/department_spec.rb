require "spec_helper"

describe Organization::Department do
 
  context 'Get total funds' do
  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = Organization::Department.new("Finance_Delhi", 10000)
  		sub_department2 = Organization::Department.new("Finance_Indore", 10000)
  		sub_department3 = Organization::Department.new("Finance_Mumbai", 10000)
  		department = Organization::Department.new("Finance",0, [sub_department1, sub_department2, sub_department3])
  		expect(department.get_cash).to eq(30000.0)
  	end	
  end   
end