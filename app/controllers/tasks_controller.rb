class TasksController < ApplicationController
  
  
  def index
    @user = User.find(params[:user_id])
    @tasks = Task.find(params[:task_id])
  end
end
