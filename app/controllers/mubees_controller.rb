class MubeesController < ApplicationController
  before_action :set_mubee, only: [:show, :update, :destroy]

  # GET /mubees
  def index
    @mubees = Mubee.all

    render json: @mubees
  end

  # GET /mubees/1
  def show
    render json: @mubee
  end

  # POST /mubees
  def create
    @mubee = Mubee.new(mubee_params)

    if @mubee.save
      render json: @mubee, status: :created, location: @mubee
    else
      render json: @mubee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mubees/1
  def update
    if @mubee.update(mubee_params)
      render json: @mubee
    else
      render json: @mubee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mubees/1
  def destroy
    @mubee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mubee
      @mubee = Mubee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mubee_params
      params.require(:mubee).permit(:crew_id, :producer_id, :accepted, :location, :budget)
    end
end
