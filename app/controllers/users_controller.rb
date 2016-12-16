class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /users
  def index
    if params[:skill_ids]

      if params[:latitude] && params[:longitude]
        # cast params to float as box center point.
        center_point = [Float(params[:latitude]), Float(params[:longitude])]
        # calculate bounding box for query.
        distance = 20
        box = Geocoder::Calculations.bounding_box(center_point, distance)
        @users = User.includes(:skills).where(skills: { id: params[:skill_ids] }, crew: true).where.not(id: current_user.id).within_bounding_box(box)
      else
        @users = User.includes(:skills).where.not(id: current_user.id).where(skills: { id: params[:skill_ids] }, crew: true)
      end
    # else
    #   @users = User.includes(:reviews).where (received_reviews: { id: params [:received_reviews]}, crew: true)
    # end

    else
      @users = User.where(crew: true)
    end

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user == current_user

      if @user.update(Uploader.upload(user_params))
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end

    else
      render json: { errors: ["Unauthorized"] }, status: 401
    end

  end


  # DELETE /users/1
  def destroy
    if @user == current_user
      @user.destroy
    else
      render json: { errors: ["Unauthorized"] }, status: 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:username, :email, :password_digest, :location, :image, :full_name, :website, :crew, :base64, :latitude, :longitude, skill_ids:[])
    end
end
