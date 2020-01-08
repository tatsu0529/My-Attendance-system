class TasksController < ApplicationController
  before_action :set_user
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:index, :edit, :update]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = @user.tasks.order(created_at: :desc)
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
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
  
  
  def set_task
      unless @task = @user.tasks.find_by(id: params[:id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_url @user
      end
    end
    
  def set_user
    @user = User.find(params[:user_id])
  end
  
  
end
