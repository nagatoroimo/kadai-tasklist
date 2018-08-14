class ToppagesController < ApplicationController

  def index
    if logged_in?
      @user = current_user
      @task = current_user.tasks.build  # form_for 用
      @task = current_user.tasks.order(created_at: :desc).page(params[:page])
      
      #@task = current_user.tasks.page(params[:page]).per(5)
    end
  end
  
end
