class TasksController < ApplicationController
  before_action :get_task, only: [:edit, :show, :update, :destroy, :complete, :uncomplete]

  def index
    @open_tasks = Task.where(completed: false)
    @completed_tasks = Task.where(completed: true)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def complete
    @task.update_attribute(:completed, true)
    redirect_to tasks_path
  end

  def uncomplete
    @task.update_attributes(completed: false)
    redirect_to tasks_path
  end

  private

  def get_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :completed)
  end
end