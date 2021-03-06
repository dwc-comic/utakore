 class Admin::UsersController < Admin::Base
# protect_from_forgery except: :search # searchアクションを除外
   def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to user_path(user.id)
  end

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
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user.id)
  end

  def destroy
  	@user = User.find(params[:id])
  end

  # def search
  #   @user = User.where('name LIKE(?)', "%#{params[:keyword]}%")
  #   redirect_to 'admin_users_path'
  # end

  private

  def user_params
        params.require(:user).permit(:name,:kane, :email )
  end

end
