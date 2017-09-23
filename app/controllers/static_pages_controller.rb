class StaticPagesController < ApplicationController

  def home

    if logged_in? && current_user.status == "student" && current_user.student == nil
      flash[:info] = 'まずマイページを作りましょう'
      redirect_to new_student_path

    elsif  logged_in? && current_user.status == "student" && Teacher.any?
      @feed_items = Teacher.feed(current_user)
    end

    if logged_in? && current_user.status == "teacher" && current_user.teacher == nil
      flash[:info] = 'まずマイページを作りましょう'
      redirect_to new_teacher_path

    elsif logged_in? && current_user.status == "teacher" && Student.any?
      @feed_items = Student.feed(current_user)

    end
  end
end
