class DocsController < ApplicationController

  before_action :set_comment, only: %i[edit create update destroy]
  before_action :set_params, only: %i[create destroy update]

	def create
	    @doc = @comment.docs.create(doc_params)
	    respond_to do |format|
	      format.js
	    end
    end

    def destroy
      @doc = @comment.docs.find(params[:id])
      @doc.destroy
      respond_to do |format|
        format.js
      end
    end


    private

    def set_params
      @project= Project.find_by(id: params[:project_id])
      @task= Task.find_by(id: params[:task_id])
      @docs = Doc.where(comment_id: params[:comment_id])
    end

    def set_comment
      @comment = Comment.find_by(id: params[:comment_id])
    end

	def doc_params
      params.require(:doc).permit(:file)
    end

end
