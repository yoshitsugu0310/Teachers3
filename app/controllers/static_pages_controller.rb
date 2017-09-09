class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = Teacher.feed

  end
end
end
