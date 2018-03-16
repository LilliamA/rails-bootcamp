class CommentsController < ApplicationController


	before_action :set_task, only: %i[edit create update destroy]
	before_action :set_params, only: %i[edit create destroy update]

	def index

		@comments = Comment.all
	    respond_to do |format|
	      format.html
    	end
    end

    def show
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:task_id])
	    @comment = Comment.find(params[:id])
      @docs = Doc.where(comment_id: params[:id])
	    respond_to do |format|
	      format.html
	    end
    end

    def edit
  	 @comment = @task.comments.find(params[:id])
    end

	def create
	    @comment = @task.comments.create(comment_params)
	    respond_to do |format|
	      format.js
	    end
    end

    def update
	  @comment = @task.comments.find(params[:id])
      if @comment.update(comment_params)
        redirect_to project_task_path(@project, @task)
      else
        format.html { render :edit }
      end
    end

    def destroy
	    @comment = @task.comments.find(params[:id])
	    @comment.destroy
	    respond_to do |format|
	      format.js
	    end
    end

    private

    def set_task
      @task = Task.find_by(id: params[:task_id])
    end

    def set_params
      @project= Project.find_by(id: params[:project_id])
      @comments = Comment.where(task_id: params[:task_id])
    end


	def comment_params
      params.require(:comment).permit(:text)
    end

end
