module QuestionsHelper
  def question_header(method, title)
    "#{method.capitalize} New #{title} Question"
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test-Guru', "https://github.com/#{author}/#{repo}"
  end
end
