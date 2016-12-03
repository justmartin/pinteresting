class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all.order("random()").paginate(:page => params[:page], :per_page => 15)
  end

  def nineties
    @nineties_pins = Pin.where(decade: "90's").order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  def eighties
    @eighties_pins = Pin.where(decade: "80's").order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @pins = Pin.find_by(id: params[:id])
    @comments = @pins.comments.all
  end

  def new
    @decades = [
      ["90's", "90's"],
      ["80's", "80's"],
      ["70's", "70's"],
      ["60's", "60's"]
    ]

    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url, notice: 'Pin was successfully destroyed.'
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not Authorized To Edit This Pin" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description, :image, :decade)
    end
end
