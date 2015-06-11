require "spec_helper"

describe Organization::ProcurementDepartment do
  context 'cash' do
  	it "should return cash  as 200 for a Procurement Department having funds as 200" do
  		department1 = Organization::ProcurementDepartment.new("Finance", 200, 0)
  		expect(department1.cash).to eq(200)
  	end
  end

  context 'inventory' do
  	it "should return inventory  as 200 for a Procurement Department initialized with 200 products" do
  		department1 = Organization::ProcurementDepartment.new("Finance", 1000, 200)
  		expect(department1.inventory).to eq(200)
  	end
  end
end