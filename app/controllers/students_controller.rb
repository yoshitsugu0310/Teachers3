class StudentsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :create]
  before_action :correct_user, only: [:edit, :update]


  def new
    @student = current_user.build_student
    @student.user_id = current_user.id

    @student.save
  end

  def index
  end

  def create
    @student = current_user.build_student(student_params)


    if @student.save
      # 保存の成功をここで扱う。
      flash[:info] = "Create My Page"
      redirect_to @student
    else
      # redirect_to edit_student_path(id: @student.user.id)

    render 'edit'

    end
  end

  def edit


   if !Student.exists?(user_id: params[:id])

     @student = current_user.build_student
     @student.user_id = current_user.id

     @student.save
   else
     @student = Student.find_by(user_id: params[:id])
  end
end

  def update
      @student = Student.find_by(user_id: params[:id])
     if @student.update_attributes(student_params)
       #更新に成功した場合
       flash[:success] = "MyPage updated"
      redirect_to url: student_path(@student.user_id)
     else
       render 'edit'
     end
   end




  def show

    @student = Student.find_by(user_id:params[:id])
    @user = User.find(@student.user_id)

  end

  private

   def student_params
     params.require(:student).permit(:sex, :grade, :post_number, :japanese, :math, :science, :social, :english, :station)
   end



end
