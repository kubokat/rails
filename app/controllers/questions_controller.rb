class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:destroy]
  before_action :find_test, only: [:create, :index]
  before_action :find_question, only: [:show, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_find_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  def destroy
    render json: @question.delete()
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: question.inspect
    else
      handle error
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id]);
  end

  def rescue_question_find_not_found
    render plain: "object not found", status: 404
  end

end
