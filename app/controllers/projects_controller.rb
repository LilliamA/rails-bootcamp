class ProjectsController < ApplicationController

    def index
        @projects = Project.all
        respond_to do |format|
            format.html
        end
    end

    def new
    end

    def create
    end 

    def update
    end

    def edit
    end
    
    def show
        @project = Project.find(params[:id])
        respond_to do |format|
            format.html
        end
    end

    def destroy
    end

    private

        
    def project_params
        params.require(:project).permit(:tittle)
    end
end
