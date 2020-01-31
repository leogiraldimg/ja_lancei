require 'rails_helper'

RSpec.describe Manager, :type => :model do
    context "validation tests - required or not" do
        it 'ensures email is required' do
			manager = Manager.new(:email => "", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save

			expect(manager).to eq(false)
        end
        
        it 'ensures first_name is required' do
			manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save

			expect(manager).to eq(false)
        end
        
        it 'ensures last_name is required' do
			manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Teste", :last_name => "", :password => "teste001", :password_confirmation => "teste001").save

			expect(manager).to eq(false)
        end

        it 'ensures password is required' do
			manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Teste", :last_name => "001", :password => "", :password_confirmation => "teste001").save

			expect(manager).to eq(false)
        end
        
        it 'ensures password_confirmation is required' do
			manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "").save

			expect(manager).to eq(false)
		end
    end

    context "validation tests - length" do
        it 'long email' do
            manager = Manager.new(:email => "teste.001@teste.com.brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save

            expect(manager).to eq(false)
        end

        it 'long first_name' do
            manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Testeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save

            expect(manager).to eq(false)
        end

        it 'long last_name' do
            manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Teste", :last_name => "001111111111111111111111111111111111111111111111111", :password => "teste001", :password_confirmation => "teste001").save

            expect(manager).to eq(false)
        end

        it 'short password' do
            manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Teste", :last_name => "001", :password => "teste", :password_confirmation => "teste001").save

            expect(manager).to eq(false)
        end

        it 'short password_confirmation' do
            manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste").save

            expect(manager).to eq(false)
        end
    end

    context "validation tests - format" do
        it 'wrong email format' do
            manager = Manager.new(:email => "teste.001teste.com.br", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save
            expect(manager).to eq(false)

            manager = Manager.new(:email => "teste.001@", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save
            expect(manager).to eq(false)

            manager = Manager.new(:email => "teste.001@teste", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save
            expect(manager).to eq(false)

            manager = Manager.new(:email => "teste.001@testecombr", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save
            expect(manager).to eq(false)
        end

        context "validation tests - uniqueness" do
            it 'ensures email uniqueness' do
                manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save
                expect(manager).to eq(true)

                manager = Manager.new(:email => "teste.001@teste.com.br", :first_name => "Teste", :last_name => "001", :password => "teste001", :password_confirmation => "teste001").save
                expect(manager).to eq(false)
            end
        end
    end
end
