class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  # GET /dashboard
  def index
    @user = current_user
    @mubees = get_mubees_for_user()
    render json: {'user' => @user, 'mubees' => @mubees}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_mubees_for_user
      return {
        'crew' => Mubee.where(crew_id: current_user.id),
        'producer' => Mubee.where(producer_id: current_user.id)
      }
    end
end
