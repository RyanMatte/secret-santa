class AccountController < ApplicationController
  before_action :require_login
  def edit 
    @user
  end

  def update
    respond_to do |format|
      if user.update(user_params)
        format.html { redirect_to gifts_path, notice: "Your account details have been updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:name, :last_name, :address, :apartment_suite, :city, :country, :state, :postal_code)
  end
end
