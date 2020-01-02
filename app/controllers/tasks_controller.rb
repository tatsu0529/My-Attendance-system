class TasksController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "新規作成に成功しました。"
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  def update
      @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_tasks_url
    else
      render :edit
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:name, :description)
  end
  
end
