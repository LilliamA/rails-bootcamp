class TasksController < ApplicationController

  before_action :set_tasks, only: %i[destroy update]
  before_action :set_tasks_create, only: %i[create]

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
    respond_to do |format|
      if @task.save
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update

    respond_to do |format|
      if @task.update(task_params)
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    def set_tasks
      @task = Task.find(params[:id])
      @tasks = Task.where(:project_id => @task.project_id)
    end

    def set_tasks_create
      @task = Task.new(task_params)
      @tasks = Task.where(:project_id => @task.project_id)
    end

    def task_params
      params.require(:task).permit(:title, :priority, :project_id)
    end

end
