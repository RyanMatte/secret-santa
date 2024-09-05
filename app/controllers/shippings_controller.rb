class ShippingsController < ApplicationController
    before_action :require_login
    before_action :shipping, only: %i[ show edit update destroy ]
  
    # GET /shippings or /shippings.json
    def index
      @user_match = User.find_by(name: current_user.matched_with)
      @shippings = current_user.shippings.all
    end
      # GET /gifts/1 or /gifts/1.json
    def show
      @shipping
    end

      # GET /shippings/new
    def new
      @shipping = Shipping.new
    end

    # POST /shippings or /shippings.json
    def create
      @shipping = current_user.shippings.new(shipping_params)
      @shipp

      respond_to do |format|
        if @shipping.save
          format.html { redirect_to root_url, notice: "Shipping was successfully created." }
          format.json { render :show, status: :created, location: @shipping }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @shipping.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /shippings/1 or /shippings/1.json
    def update
      if params[:mark_as_received].present?
        @shipping.update(received: true)
        redirect_to root_path, notice: 'Package marked as received.'
      else
        respond_to do |format|
          if @shipping.update(shipping_params)
            format.html { redirect_to shipping_url(@shipping), notice: "Shipping was successfully updated." }
            format.json { render :show, status: :ok, location: @shipping }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @shipping.errors, status: :unprocessable_entity }
          end
        end
      end
    end

    def update_received
      if @shipping.update(received: true)
        redirect_to root_path, notice: 'Package marked as received.'
      else
        # Handle update failure
      end
    end

    # DELETE /shippings/1 or /shippings/1.json
    def destroy
      @shipping.destroy

      respond_to do |format|
        format.html { redirect_to shippings_url, notice: "Shipping was successfully destroyed." }
        format.json { head :no_content }
      end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def shipping
      @shipping ||= Shipping.find(params[:id])
    end

    def shipping_params
      params.require(:shipping).permit(:expected_at, :shipped_at, :status, :name_on_package, :receieved)
    end
  end