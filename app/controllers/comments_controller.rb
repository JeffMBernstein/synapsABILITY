class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		@question = Question.find(params[:id])
	end

	def create
		@comment = Comment.new(comment_params)
		@question = Question.find(params[:id])
		@comment.question_id = @question.id
		@comment.save
		redirect_to questions_path
	end

	private

	def comment_params
		params.require(:comment).permit(:description, :upvote, :downvote, :question_id)
	end

end
