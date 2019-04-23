require 'octokit'

class GitHubClient

  def initialize
    setup_http_client
    @client = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end

  def create_gist(params)
    @client.create_gist(params)
  end

  def last_response
    @client.last_response
  end

  private

  def setup_http_client
    Octokit.api_endpoint = ENV['ROOT_ENDPOINT']
  end
end
