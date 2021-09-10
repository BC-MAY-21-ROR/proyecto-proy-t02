class OffersController < ApplicationController
  before_action :set_offer, only: %i[ edit update ]

  # GET /offers
  def index
    @offers = Offer.all
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit; end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      flash[:success] = 'offer was successfully created'
      redirect_to offers_path
    else
      flash[:error] = 'offer was not created'
      render :new
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      flash[:success] = 'offer was successfully updated'
      redirect_to offers_path
    else
      flash[:error] = 'offer was not updated'
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def offer_params
    params.require(:offer).permit(:name, :status, :discount)
  end
end
