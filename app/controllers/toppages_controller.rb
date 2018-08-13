class ToppagesController < ApplicationController

  def index
    if logged_in?
      @task = Task.where(user_id: current_user.id).page(params[:page]).per(5)
    end
  end
  
end
