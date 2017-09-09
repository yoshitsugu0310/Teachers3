class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  private

  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  #生徒かどうかを確認
  def reviewer_student
    redirect_to(teacher_url) unless current_user.status == "student"
  end




end
