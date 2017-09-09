class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
   @user = User.find(params[:id])
   if @user.status == 10
   @student = @user.students
 end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # 保存の成功をここで扱う。
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
     if @user.update_attributes(user_params)
       #更新に成功した場合
       flash[:success] = "Profile updated"
      redirect_to @user
     else
       render 'edit'
     end
   end

   def destroy
     User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

   def user_params
     params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :status)
   end

   def student_params
     params.require(:student).permit(:sex, :post_number, :japanese, :math, :science, :social, :english, :station)
   end

   # beforeアクション





    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
