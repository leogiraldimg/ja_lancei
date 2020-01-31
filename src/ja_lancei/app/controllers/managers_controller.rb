class ManagersController < ApplicationController
    def new
        @manager = Manager.new
    end
     
    def create
        @manager = Manager.new(manager_params)
        
        if @manager.save
            flash[:success] = t("success_manager_create")
            redirect_to welcome_po_path
        else
            render 'new'
        end
    end

    private
        def manager_params
            params.require(:manager).permit(:email, :first_name, :last_name, :password, :password_confirmation)
        end
end
