class TownshipsController < ApplicationController
  before_action :set_township, only: %i[edit update]
  layout 'super_admin'

  # GET /township
  def index
    @pagy, @townships = pagy(Township.includes(:state))
  end

  # GET /townships/new
  def new
    @township = Township.new
  end

  # GET /townships/1/edit
  def edit; end

  # POST /townships
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

  # PATCH/PUT /townships/1
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
