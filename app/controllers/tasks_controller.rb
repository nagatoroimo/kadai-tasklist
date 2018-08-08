class TasksController < ApplicationController
  
  def index
    @task = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(params_task)
      flash[:sccess] = "タスクを更新しました"
      redirect_to @task
    else
      flash[:denger] = "タスクの更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:sccess] = "タスクを削除しました"
    redirect_to tasks_url
  end
  
  private
  
  def params_task
    params.require(:task).permit(:content)
  end
  
end
