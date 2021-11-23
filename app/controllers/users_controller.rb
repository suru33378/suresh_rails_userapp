class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
        

    end

    def index 
        @users = User.all
    end

    def new
        @user = User.new
        2.times { @user.build_address }
        1.times {@user.phone_numbers.build}
        
    end

    def edit
        

    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "user added successfully"
            redirect_to @user
        else
            render 'new'
        end
    end
    def update
        if @user.update(user_params)   
            flash[:notice] = "User was updated successfully."
            redirect_to @user
        else
            render 'edit'
        end

    end

    def destroy
        @user.destroy
        redirect_to users_path
      end

    
      private

      def set_user
        @user = User.find(params[:id])
      end
    
      def user_params
        params.require(:user).permit(:username, :email, :password, :active, address_attributes:[:address_line, :state, :city, :zip], phone_numbers_attributes:[:phonenumber])
      end
end