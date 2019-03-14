class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:destroy]
  before_action :find_test, only: [:create, :index, :new]
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_find_not_found

  def index
    @questions = Question.all
  end

  def show
    @question
  end

  def destroy
    render json: @question.delete()
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to question
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
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
