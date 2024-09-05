class GiftsController < ApplicationController
  before_action :require_login
  before_action :set_gift, only: [:show, :edit, :update, :destroy]


  # GET /gifts or /gifts.json
  def index
    @user_match = User.find_by(name: current_user.matched_with)
    @other_user = User.find_by(matched_with: current_user.name.to_s)
    @gifts = current_user.gifts.all
    @shippings = @other_user&.shippings&.all
    @name = current_user.name
  end

  # GET /gifts/1 or /gifts/1.json
  def show
    @gift
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # POST /gifts or /gifts.json
  def create
    @gift = current_user.gifts.new(gift_params)

    respond_to do |format|
      if @gift.save
        format.html { redirect_to root_url, notice: "Gift was successfully created." }
        format.json { render :root, status: :created, location: @gift }
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
        format.html { redirect_to root_url, notice: 'Gift was successfully updated.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@gift, partial: 'gifts/gift', locals: { gift: @gift }) }
      else
        format.html { render :edit }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@gift, partial: 'gifts/form', locals: { gift: @gift }) }
      end
    end
  end

  # DELETE /gifts/1 or /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@gift) }
    end
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def gift
      @gift ||= Gift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gift_params
      params.require(:gift).permit(:name, :url, :notes)
    end
end
