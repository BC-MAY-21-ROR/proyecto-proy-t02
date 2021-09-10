class StatesController < ApplicationController
  before_action :set_state, only: %i[edit update]
  layout 'super_admin'

  # GET /states
  def index
    @states = State.all
  end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit; end

  # POST /states
  def create
    @state = State.new(state_params)
    if @state.save
      flash[:success] = 'state was successfully created'
      redirect_to states_path
    else
      flash[:error] = 'state was not created'
      render :new
    end
  end

  # PATCH/PUT /states/1
  def update
    if @state.update(state_params)
      flash[:success] = 'state was successfully updated'
      redirect_to states_path
    else
      flash[:error] = 'state was not updated'
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_state
    @state = State.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def state_params
    params.require(:state).permit(:name)
  end
end
