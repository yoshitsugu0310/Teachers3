class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = Teacher.feed
      @student = Student.find_by(user_id: current_user.id)
      @array = Array.new.map{Array.new(2,0)}
      i = 0
      @feed_items.each do |teacher|
        distance = User.distance(@student.latitude, @student.longitude, teacher.latitude, teacher.longitude)
        @array[i] = [teacher.user_id, distance]
        i += 1
      end
    end
  end
end
