require 'rails_helper'

RSpec.describe ManagersController, :type => :controller do
    describe "GET #new" do
        it "has a 200 status code" do
            get :new
            expect(response.status).to eq(200)
        end
    end

    describe "POST #create" do
        before(:each) do
            @manager = FactoryBot.build(:manager)
        end

        it "redirected to welcome_po_path" do
            post :create, params: {manager: {email: @manager.email, first_name: @manager.first_name, last_name: @manager.last_name, password: @manager.password, password_confirmation: @manager.password_confirmation}}

            expect(response).to redirect_to(welcome_po_path)
        end

        it "rendered new" do
            post :create, params: {manager: {email: "", first_name: @manager.first_name, last_name: @manager.last_name, password: @manager.password, password_confirmation: @manager.password_confirmation}}

            expect(response).to render_template(:new)
        end
    end
end
