class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :reviewer_student, only: :create


  def create
    @teacher = User.find(session[:teacher])
    @review = @teacher.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to teacher_path(@review.user_id)
    end
  end

  private

    def review_params
        params.require(:review).permit(:user_id, :content, :review)
    end
end
