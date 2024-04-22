require "rails_helper"

RSpec.describe CustomersController, type: :controller do

  describe "as a guest" do
    context "#index" do
      it "responds successfully" do
        get :index
        
        expect(response).to be_successful
      end 
      
      it "responds a 200 response" do
        get :index
    
        expect(response).to have_http_status(200)
      end      
    end

    context "Guest not authorized" do
      it "responds a 302 response (not authorized)" do
        customer = create(:customer)
        
        get :show, params: { id: customer.id }
    
        expect(response).to have_http_status(302)
      end
    end    
  end

  describe "as logged member" do
    before do
      @member = create(:member)
      @customer = create(:customer)
    end
    
    context "#show" do
      it "responds a 200 response" do 
        sign_in @member
        
        get :show, params: { id: customer.id }
        expect(response).to have_http_status(200)
      end

      it "returns a :show template" do
        sign_in @member
        
        get :show, params: { id: customer.id }
        expect(response).to render_template(:show)
      end      
    end
    
    context "when is create an member" do
      it "with valid attributes" do
        customer_params =  attributes_for(:customer)
        sign_in @member
        expect{ 
          post :create, params: { customer: customer_params } 
        }.to change(Customer, :count).by(1)
      end

      it "returns a flash notice success" do
        customer_params =  attributes_for(:customer)
        sign_in @member
        post :create, params: { customer: customer_params }
        expect(flash[:notice]).to eq("Customer was successfully created.")
      end

      it "Content-type" do
        customer_params = attributes_for(:customer)
        sign_in @member
        post :create, format: :json, params: { customer: customer_params }
        p response
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end     
    end
    
    context "when not create an customer" do
      it "with invalid attributes" do        
        customer_params = attributes_for(:customer, adrdress: nil)
        sign_in @member
        expect{
          post :create, params: { customer: customer_params}
        }.not_to change(Customer, :count)
      end
         
    end    
  end
end
