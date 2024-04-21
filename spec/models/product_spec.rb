require 'rails_helper'

RSpec.describe Product, type: :model do
  context "validations" do    
    it "is valid with description, price and category" do
      product = create(:product)
      expect(product).to be_valid
    end
    
    it "is invalid without description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end
    # or
    # it { should validate_presence_of(:description) }
    # it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to belong_to(:category) }
  
    it "is invalid without price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
  
    it "is invalid without category" do
      product = build(:product, category: nil)
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")
    end
  end
  
  context "Methods" do
    it "returns a product with a full description" do
      product = create(:product, description: "Product 1", price: 1.22)
      #expect(product.full_description).to eq("#{product.description} - #{product.price}")
      expect(product.full_description).to eq("Product 1 - 1.22")
    end    
  end
end
