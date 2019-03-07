class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:destroy]
  before_action :find_test, :only => [:create, :index]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_find_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: Question.find(params[:id])
  end

  def destroy
    render json: Question.delete(params[:id])
  end

  def new
  end

  def create
    question = @test.questions.create(question_params)
    render plain: question.inspect
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_question_find_not_found
    render plain: "object not found", status: 404
  end

end
