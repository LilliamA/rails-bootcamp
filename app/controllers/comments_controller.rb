class CommentsController < ApplicationController


	before_action :set_task, only: %i[edit new create update destroy]
	before_action :set_comments, only: %i[create destroy update]

	def index

		@comments = Comment.all
	    respond_to do |format|
	      format.html
    	end
    end

	def index
	    @tasks = Task.all
	    respond_to do |format|
	      format.html
	    end
    end

    def show
	    @comment = Comment.find(params[:id])
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
      @project= Project.find_by(id: params[:project_id])
      @task = Task.find_by(id: params[:task_id])
    end

    def set_comments
      @comments = Comment.where(task_id: params[:task_id])
    end


	def comment_params
      params.require(:comment).permit(:text)
    end

end
