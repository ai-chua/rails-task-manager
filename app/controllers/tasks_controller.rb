class TasksController < ApplicationController
  # CREATE
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)
    @task.save
    redirect_to task_path(@task)
  end

  # READ
  def show
    puts 'This is from TasksController for show (one) task'
    @task = Task.find(params[:id])
  end

  def tasks
    @tasks = Task.all
    puts 'This is from TasksController fetching all tasks to Task View (Index)'
  end

  # UPDATE
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(strong_params)
    redirect_to task_path(@task)
  end

  # DELETE
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
