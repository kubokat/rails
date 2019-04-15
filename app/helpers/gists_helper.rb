module GistsHelper
  def hash_url(url)
    url.split('/').last
  end
end
