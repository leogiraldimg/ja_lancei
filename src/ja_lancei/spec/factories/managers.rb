FactoryBot.define do
	factory :manager do
		email {"teste.001@teste.com.br"}
        first_name {"Teste"}
        last_name {"001"}
        password {"teste001"}
        password_confirmation {"teste001"}
	end
end