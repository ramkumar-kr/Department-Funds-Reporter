require "spec_helper"

describe Organization::ProcurementDepartment do
  context 'cash' do
  	it "should return cash  as 200 for a Procurement Department having funds as 200" do
  		department1 = FactoryGirl.build(:procurement_department, cash: 200)
  		expect(department1.cash).to eq(200)
  	end
  end

  context 'inventory' do
  	it "should return inventory  as 200 for a Procurement Department initialized with 200 products" do
  		department1 = FactoryGirl.build(:procurement_department, inventory: 200)
  		expect(department1.inventory).to eq(200)
  	end

    context 'Category' do
      it "should return inventory of black clothes as 40" do
        department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
        expect(department.inventory_by_colour("black")).to eq(40)
      end

      it "should return inventory of black clothes as 0" do
        department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "white"})
        expect(department.inventory_by_colour("black")).to eq(0)
      end

      it "should return inventory of black clothes as 0" do
        department = FactoryGirl.build(:procurement_department, inventory: 40)
        expect(department.inventory_by_colour("black")).to eq(0)
      end

      it "should return inventory as 0" do
        department = FactoryGirl.build(:procurement_department, inventory: 40)
        expect(department.inventory_of_black_and_not_jeans_or_t_shirts).to eq(0)
      end

      it "should return inventory of black clothes which are jeans as 0 " do
        department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"garment_subtype" => "jeans", "colour" => "black"})
        expect(department.inventory_of_black_and_not_jeans_or_t_shirts).to eq(0)
      end

      it "should return inventory of black clothes which are t shirts as 0 " do
        department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"garment_subtype" => "t_shirt", "colour" => "black"})
        expect(department.inventory_of_black_and_not_jeans_or_t_shirts).to eq(0)
      end

      it "should return inventory of black clothes which are formal shirts as 40 " do
        department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"garment_subtype" => "formal_shirt", "colour" => "black"})
        expect(department.inventory_of_black_and_not_jeans_or_t_shirts).to eq(40)
      end

      it "should return inventory of white clothes which are formal shirts as 0 " do
        department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"garment_subtype" => "formal_shirt", "colour" => "white"})
        expect(department.inventory_of_black_and_not_jeans_or_t_shirts).to eq(0)
      end

      context "Men t shirts or women scarfs" do
        it "should return inventory as 0" do
          department = FactoryGirl.build(:procurement_department, inventory: 40)
          expect(department.inventory_of_men_t_shirts_or_women_scarfs).to eq(0)
        end

        it "should return inventory of men clothes which are T shirts as 40 " do
          department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"garment_subtype" => "t_shirt", "gender" => "men"})
          expect(department.inventory_of_men_t_shirts_or_women_scarfs).to eq(40)
        end

        it "should return inventory of men clothes which are formal shirts as 0 " do
          department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"garment_subtype" => "formal_shirt", "gender" => "men"})
          expect(department.inventory_of_men_t_shirts_or_women_scarfs).to eq(0)
        end

        it "should return inventory of women clothes which are scarfs as 40 " do
          department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"garment_subtype" => "scarf", "gender" => "women"})
          expect(department.inventory_of_men_t_shirts_or_women_scarfs).to eq(40)
        end

        it "should return inventory of women clothes which are not scarfs as 0 " do
          department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"garment_subtype" => "shirt", "gender" => "women"})
          expect(department.inventory_of_men_t_shirts_or_women_scarfs).to eq(0)
        end
      end
    end
  end
  
end