class TasksController < ApplicationController

  before_action :set_tasks, only: %i[create destroy update]
  before_action :set_project, only: %i[edit new create destroy update]

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

  def edit
     binding.pry
  	 @task = @project.tasks.find(params[:id])
  end

  def create
    @task = @project.tasks.create(task_params)
    respond_to do |format|
      format.js
    end
  end

  def update
    @task = @project.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    def set_project
      @project= Project.find_by(id: params[:project_id])
    end

    def set_tasks
      @tasks = Task.where(project_id: params[:project_id])
    end

    def task_params
      params.require(:task).permit(:title, :priority)
    end

end
