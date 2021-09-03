class TownsController < ApplicationController
  before_action :set_town, only: %i[edit update]

  # GET /states
  def index
    @towns = Town.all
    @townships = Township.all    
  end

  # GET /states/new
  def new
    @town = Town.new
  end

  # GET /states/1/edit
  def edit; end

  # POST /states
  def create
    @town = Town.new(town_params)
    if @town.save
      flash[:success] = 'town was successfully created'
      redirect_to towns_path
    else
      flash[:error] = 'town was not created'
      render :new
    end
  end

  # PATCH/PUT /states/1
  def update
    if @town.update(town_params)
      flash[:success] = 'town was successfully updated'
      redirect_to towns_path
    else
      flash[:error] = 'town was not updated'
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_town
    @town = Town.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def town_params
    params.require(:town).permit(:name, :township_id)
  end
end
