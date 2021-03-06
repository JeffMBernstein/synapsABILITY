class QuestionsController < ApplicationController

	before_action :require_current_user

	def index
		@questions = Question.all
		@question = Question.new
		@comment = Comment.new
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			flash[:message] = "Successfully created question!"
			redirect_to questions_path
		else
			flash[error] = "Failed to create question. Please try again."
			render action: :new
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = User.find(params[:id])
    @question.update(user_params)
    redirect_to user_path(@question)
	end

	def destroy
	end

	private

	def question_params 
		params.require(:question).permit(:title, :description, :upvote, :tag)
	end
end
