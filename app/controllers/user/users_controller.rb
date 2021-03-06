class User::UsersController < User::Base

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to user_path(user.id)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_user_path(user.id)
  end

  def destroy
    redirect_to mains_top_path
  end

  private

  def user_params
        params.require(:user).permit(:name, :email, :kana, :phone_number, :postal_code, :home_address )
  end
end
