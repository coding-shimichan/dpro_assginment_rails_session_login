class UsersController < ApplicationController
  # Hooks
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]
  
  # GET /users or /users.json
  def index
    redirect_to tasks_path
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      flash[:notice] = t(".created")
      redirect_to tasks_path
    else
      render :new
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      flash[:notice] = t(".updated")
      redirect_to user_url(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    redirect_to new_session_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
