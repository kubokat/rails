module QuestionsHelper
  def question_header(question)

    if question.new_record?
      action = :create
    else
      action = :edit
    end

    "#{action.capitalize} New #{question.test.title} Question"
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test-Guru', "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
