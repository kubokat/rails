class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show

  end

  def result
    @result = @test_passage.result_percent
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.status >= 200 && result.status <= 300
      current_user.gists.create(question_id: @test_passage.current_question.id, url: result.data.html_url)
      notice = result.data.html_url
    else
      notice = 'Octokit request error'
    end

    flash_options = { notice: notice }

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
