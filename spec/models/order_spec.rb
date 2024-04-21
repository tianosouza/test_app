require 'rails_helper'

RSpec.describe Order, type: :model do
  it "belongs_to" do
    customer = create(:customer, name: "tiano")
    order = create(:order, customer:)
    # puts order.customer.inspect
    expect(order.customer).to be_kind_of(Customer)
  end

  it "create_list" do
    orders = create_list(:order, 3)
    expect(orders.size).to eq(3)
  end
  
  it "create_pair" do
    orders = create_pair(:order)
    expect(orders.size).to eq(2)
  end

  it "has_many" do
    customer = create(:customer_with_orders)
    #puts customer.orders.inspect
    expect(customer.orders.size).to eq(3)
  end
  
  it "attributes for list" do
    # Array para armazenar os clientes criados
    created_customers = []
  
    # Gera uma lista de 4 conjuntos de atributos para clientes com pedidos
    customer_attributes_list = attributes_for_list(:customer_with_orders, 4)
    
    # Itera sobre cada conjunto de atributos para criar os clientes com pedidos
    customer_attributes_list.each do |customer_attributes|
      # Cria um cliente usando os atributos fornecidos
      customer = Customer.create(customer_attributes)
  
      # Adiciona o cliente criado ao array
      created_customers << customer
    end
  
    # Inspect no array de clientes criados para verificar seus atributos
    puts created_customers.inspect
  
    # Verifica se o número total de clientes criados é igual a 4
    expect(Customer.count).to eq(13)
  end  
end
