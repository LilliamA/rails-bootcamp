class TasksController < ApplicationController

  before_action :set_tasks, only: %i[index create destroy update]

  def index
    @tasks = Task.all
    respond_to do |format|
      format.html
    end
  end

  def show
  	@task = Task.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @task = Task.new
  end

  def edit
  	@task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    respond_to do |format|
      format.js
    end
  end

  def update

  	@task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  	@task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    def set_tasks
      @tasks = Task.all
    end

    def task_params
      params.require(:task).permit(:title, :priority, :status, :project_id)
    end

end
