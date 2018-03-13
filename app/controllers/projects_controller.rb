class ProjectsController < ApplicationController
    before_action :set_projects, only: %i[index create destroy update]
    def index
        @projects = Project.all
        respond_to do |format|
            format.html
        end
    end

    def new
         @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.save
        respond_to do |format|
            format.js
        end
    end 

    def update
         @project = Project.find(params[:id])
        if @project.update(project_params)
           respond_to do |format|
            format.js
        end
        else
            render 'edit'
        end
    end

    def edit
        @project = Project.find(params[:id])
    end
    
    def show
        @project = Project.find(params[:id])
        @tasks = Task.where(project_id: params[:id])

        @task = Task.new
        
        respond_to do |format|
            format.html
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        respond_to do |format|
            format.js
        end
    end

    private
    def set_projects
        @projects = Project.all
    end

    def project_params
        params.require(:project).permit(:tittle)
    end

    def task_params
      params.require(:task).permit(:title, :priority, :project_id)
    end
end
