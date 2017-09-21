class StaticPagesController < ApplicationController

  def home

    if current_user.student == nil || current_user.teacher == nil
      if current_user.status == "student"
        flash[:info] = 'まずマイページを作りましょう'
        redirect_to new_student_path
      elsif current_user.status == "teacher"
        flash[:info] = 'まずマイページを作りましょう'
        redirect_to new_teacher_path
      end

    elsif logged_in? && current_user.status == "student"
      @feed_items = Teacher.feed(current_user)



    elsif logged_in? && current_user.status == "teacher"
      @feed_items = Student.feed(current_user)

    end
  end
end
