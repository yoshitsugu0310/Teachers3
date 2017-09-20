class TeachersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :create, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @teacher = current_user.build_teacher
    @teacher.user_id = current_user.id

    @teacher.save
  end

  def index
  end

  def create
    @teacher = current_user.build_teacher(teacher_params)


    if @teacher.save
      # 保存の成功をここで扱う。
      flash[:info] = "Create My Page"
      redirect_to teacher_path(@teacher.user_id)
    else
      # redirect_to edit_student_path(id: @student.user.id)

    render 'edit'

    end
  end

  def edit
    if !Teacher.exists?(user_id: params[:id])

      @teacher = current_user.build_teacher
      @teacher.user_id = current_user.id

      @teacher.save
    else
      @teacher = Teacher.find_by(user_id: params[:id])
   end
  end

  def update
      @teacher = Teacher.find_by(user_id: params[:id])
     if @teacher.update_attributes(teacher_params)
       #更新に成功した場合
       flash[:success] = "MyPage updated"
      redirect_to url: teacher_path(@teacher.user_id)
     else
       render 'edit'
     end
   end

   def show
     #既に書かれているレビュー
     @teacher = Teacher.find_by(user_id:params[:id])  #レビューの対象となる先生を参照
     @user = User.find(@teacher.user_id)  #先生のidでuserを参照
     @reviews = @user.reviews #reviewsはuserテーブルと紐付いてる

     #新しいレビュー
     @new_review = @user.reviews.build
     @new_review.user_id = @user.id

     session[:teacher] = @user.id
     if @average = @user.reviews.get_review_average
     @average_100 = (@average / 5) * 100
    else
     @average = 0
     @average_100 = 0
   end

    @matches = Match.where(teacher_id: @teacher.user_id)
    
   end

  private

   def teacher_params
     params.require(:teacher).permit(:sex, :post_number, :japanese, :math, :science, :social, :english, :university_name, :fee, :appeal)
   end


end
