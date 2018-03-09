class ProjectsController < ApplicationController
    before_action :set_projects, only: %i[index create]
    def index
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
            redirect_to @project
        else
            render 'edit'
        end
    end

    def edit
        @project = Project.find(params[:id])
    end
    
    def show
        @project = Project.find(params[:id])
        respond_to do |format|
            format.html
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
    end

    private
    def set_projects
        @projects = Project.all
    end 
    def project_params
        params.require(:project).permit(:tittle)
    end
end
