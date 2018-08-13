class TasksController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  def index
    @task = Task.where(user_id: current_user.id).page(params[:page]).per(5)
  end
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    
    if @task.save
      flash[:susscess] = "タスクを登録しました"
      redirect_to @task
    else
      flash.now[:denger] = "タスクの登録が失敗しました"
      render :new
    end
  end

  def edit
  end
  
  def update
    if @task.update(params_task)
      flash[:sccess] = "タスクを更新しました"
      redirect_to @task
    else
      flash[:denger] = "タスクの更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:sccess] = "タスクを削除しました"
    redirect_to tasks_url
  end
  
  private
  
  def set_params
    @task = Task.find(params[:id])
  end

  def params_task
    params.require(:task).permit(:content, :status, :user_id)
  end
  
  def authenticate_user
    if @task.user_id != current_user.id.to_s
      flash[:success] = "権限がありません"
      redirect_to root_url
    else
    end
  end
end
