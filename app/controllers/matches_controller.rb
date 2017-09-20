class MatchesController < ApplicationController
before_action :logged_in_user, only:[:destroy, :create, :edit, :new]
before_action :correct_user,   only: [:destroy]


  def new
      @match = Match.new
  end

  def create
    params.require(:match)[:teacher_id] = session[:teacher]
    params.require(:match)[:student_id] = current_user.id
    @match = Match.new(request_params)
    if @match.save
      redirect_to root_path, notice: "リクエストを送信しました！"
    else
      render :new
    end
  end

  def edit
    @match = Match.find_by(teacher_id: current_user.id)
  end

  def update
    @match = Match.find_by(teacher_id: current_user.id)
    @match.request = "t"
    if @match.update_attributes(request_params)

      flash[:success] = "リクエストを承認しました！"
      redirect_to teacher_path(current_user.id)
    else
      render 'edit'
    end
  end

  def destroy
    Match.find_by(teacher_id: current_user.id).destroy
    flash[:success] = "リクエストを非承認にしました。"
    redirect_to teacher_path(current_user.id)
  end



  private

    def request_params
      params.require(:match).permit(:request_time1_date, :request_time1_hour, :request_time1_minute, :request_time2_date, :request_time2_hour, :request_time2_minute, :request_time3_date, :request_time3_hour, :request_time3_minute, :teacher_id, :student_id, :appoint_time)
    end

    def appoint_params
      params.require(:match).permit(:appoint_time)
    end
  end
