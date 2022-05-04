class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]
  
  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to tasks_path, notice: "Task created successfully."
    else 
      redirect_to new_task_path, flash: { error: @task.errors.full_messages.join(" <br/> ")}
    end
  end

  def edit
  end

  def update
    if @task.update(task_params.merge(user_id: current_user.id))
      redirect_to tasks_path, notice: "Task updated successfully."
    else
      redirect_to edit_task_path(@task) , flash: { error: @task.errors.full_messages.join(" <br/> ") }
    end
  end

  def show
    
  end

  def set_google_calender
    
  end

  private

  def set_task
    @task = Task.find_by_id(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :deadline)
  end 
end
