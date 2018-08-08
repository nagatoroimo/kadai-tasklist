class TasksController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  
  def index
    @task = Task.all
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
    params.require(:task).permit(:content, :status)
  end
  
end
