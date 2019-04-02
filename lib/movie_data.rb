require 'net/http'
require 'json'
class MovieData

  def initialize(api_key, id)
    @url = 'http://www.omdbapi.com/?i=' + id + '&apikey=' + api_key
  end

  def return_movie_data
    uri = URI(@url)
    JSON.parse(Net::HTTP.get(uri))
  end
end