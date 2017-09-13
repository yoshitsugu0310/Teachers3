class MatchesController < ApplicationController
  include ClassMethods


  def new
    @match = Match.new



  end

  def create
    @match = Match.new(request_params)

    if @match.save
      redirect_to root_path, notice: "リクエストを送信しました！"
    else
      render :new
    end
  end


  private

    def request_params
      params.require(:match).permit(:request_time1_date, :request_time1_hour, :request_time1_minute, :request_time2_date, :request_time2_hour, :request_time2_minute, :request_time3_date, :request_time3_hour, :request_time3_minute)
    end
  end
