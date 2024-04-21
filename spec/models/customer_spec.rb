require "rails_helper"

RSpec.describe Customer, type: :model do
  # fixtures :customers

  it "#full_name  sobrescrevendo Atributo" do
    # customer = customers(:tiano)
    customer = create(:customer)
    customer2 = create(:customer, name: "Cristiano Souza")
    puts customer.inspect
    puts customer2.inspect

    expect(customer.full_name).to start_with("Sr ")
    expect(customer2.full_name).to start_with("Sr Cristiano Souza")
  end 
  
  it "#full_name" do
    customer = create(:user) # ou create(:customer)

    expect(customer.full_name).to start_with("Sr")
  end

  it "Vip" do
    customer = create(:customer_vip) # ou create(:customer)

    expect(customer.vip).to eq(true)
  end

  it "Default" do
    customer = create(:customer_default) # ou create(:customer)

    expect(customer.vip).to eq(false)
  end

  it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1) }
  it { expect{ create_list(:customer, 2) }.to change{ Customer.all.size }.by(2) }

  it "attributes for" do
    attrs = attributes_for(:customer)    
    customer = Customer.create(attrs1)
    puts attrs
    #puts customer.inspect

    expect(customer.full_name).to start_with("Sr")
  end

  it "Atributo transitorio" do
    customer = create(:customer_default)
    puts customer.inspect
    expect(customer.name).to eq(customer.name)
  end
  
  it "Atributo transitorio evaluation" do
    customer = create(:customer_default, upcased: true)
    puts customer.inspect
    expect(customer.name.upcase).to eq(customer.name)
  end

  it "Cliente Masculino vip" do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq("M")
    expect(customer.vip).to eq(true)
  end

  it "Cliente Feminino vip" do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq("F")
    expect(customer.vip).to eq(true)
  end
  
end






# Factory