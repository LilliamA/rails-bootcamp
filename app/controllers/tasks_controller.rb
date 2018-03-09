class TasksController < ApplicationController
	def index

        @tasks = Task.all
        respond_to do |format|
            format.html
    end

    def new
         @task = Task.new
    end

    def show
        @task = Task.find(params[:id])
        respond_to do |format|
            format.html
    end
 
	def create

  		@task = Task.new(task_params)
  		@task.save
  		redirect_to @task
    end
    
    def update

        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to @task
        else
            render 'edit'
        end
	end

    
    def destroy

        @task = Task.find(params[:id])
 		@task.destroy

    end
    
    private
    
    def task_params
        params.require(:task).permit(:title, :priority, :status)
    end
end
