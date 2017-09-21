class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"

    if user.state == "student"
      redirect_to new_student_path
    elsif  user.state == "teacher"
      redirect_to new_teacher_path
    end

    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
