class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(set_task)
    @task.save
    redirect_to tasks_path
  end

  def show
    @message = if @task.completed
                 'The task is completed'
               else
                 'The task is not completed yet'
               end
  end

  def edit
    @message = if @task.completed
                 'The task is completed'
               else
                 'The task is not completed yet'
               end
  end

  def update
    @task.update(set_task)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
