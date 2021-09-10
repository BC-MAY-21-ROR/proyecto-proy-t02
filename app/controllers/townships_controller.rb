class TownshipsController < ApplicationController
  before_action :set_township, only: %i[edit update]
  layout 'super_admin'

  # GET /states
  def index
    @townships = Township.all
    @states = State.all
  end

  # GET /states/new
  def new
    @township = Township.new
  end

  # GET /states/1/edit
  def edit; end

  # POST /states
  def create
    @township = Township.new(township_params)
    if @township.save
      flash[:success] = 'township was successfully created'
      redirect_to townships_path
    else
      flash[:error] = 'township was not created'
      render :new
    end
  end

  # PATCH/PUT /states/1
  def update
    if @township.update(township_params)
      flash[:success] = 'state was successfully updated'
      redirect_to townships_path
    else
      flash[:error] = 'state was not updated'
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_township
    @township = Township.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def township_params
    params.require(:township).permit(:name, :state_id)
  end
end
