class MatchesController < ApplicationController
    before_action :require_login
  
    # GET /gifts or /gifts.json
    def index
      @user_match = User.find_by(name: current_user.matched_with)
      @gifts = @user_match.gifts.all
      @shippings = current_user.shippings.all
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def gift
      @gift ||= Gift.find(params[:id])
    end
  end