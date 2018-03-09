class CommentsController < ApplicationController

	def index

        @comments = Comment.all
        respond_to do |format|
            format.html
    end

    def new
         @comment = Comment.new
    end

    def show
        @comment = Comment.find(params[:id])
        respond_to do |format|
            format.html
    end
 
	def create

  		@comment = Comment.new(comment_params)
  		@comment.save
  		redirect_to @comment
  	
    end
    
    def update

        @comment = Comment.find(params[:id])

        if @comment.update(comment_params)
            redirect_to @comment
        else
            render 'edit'
        end
	end

    
    def destroy
    	
        @comment = Comment.find(params[:id])
 		@comment.destroy

    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:title, :priority, :status)
    end

end
