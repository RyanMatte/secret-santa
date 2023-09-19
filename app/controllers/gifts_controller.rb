class GiftsController < ApplicationController
  before_action :set_gift, only: %i[ show edit update destroy ]

  # GET /gifts or /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1 or /gifts/1.json
  def show
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts or /gifts.json
  def create
    @gift = Gift.new(gift_params)

    respond_to do |format|
      if @gift.save
        format.html { redirect_to gift_url(@gift), notice: "Gift was successfully created." }
        format.json { render :show, status: :created, location: @gift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gifts/1 or /gifts/1.json
  def update
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to gift_url(@gift), notice: "Gift was successfully updated." }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1 or /gifts/1.json
  def destroy
    @gift.destroy

    respond_to do |format|
      format.html { redirect_to gifts_url, notice: "Gift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gift_params
      params.fetch(:gift, {})
    end
end
