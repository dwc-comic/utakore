class Admin::UsersController < Admin::Base

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end
  def update
  	user = user.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def destroy
  	@user = User.find(params[:id])
  end

  def user_params
        params.require(:user).permit([:name, :email, :phone_number, :postal_code, :home_address])
  end
end
