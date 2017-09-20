class StaticPagesController < ApplicationController

  def home
    if logged_in? && current_user.status == "student"
      @feed_items = Teacher.feed(current_user)



    elsif logged_in? && current_user.status == "teacher"
      @feed_items = Student.feed(current_user)

    end
  end
end
