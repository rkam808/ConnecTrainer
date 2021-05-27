class UsersController < ApplicationController
  def edit
    # @user = current_user
    # authorize @user
    authorize current_user
  end

  def update
    authorize current_user
    if current_user.update(user_params)
      redirect_to dashboard_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :location, :bio, :photo)
  end
end
