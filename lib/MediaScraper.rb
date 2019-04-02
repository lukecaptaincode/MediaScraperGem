require_relative './movie_data'
require_relative './game_data'
require_relative './book_data'
###
# This class controls the interactions with the other components of the media
# scraper
class MediaScraper

  def initialize(books_key, games_key, movies_key)
    @books_key = books_key
    @games_key = games_key
    @movies_key = movies_key
  end

  def get_movie_info(id)
    MovieData.new(@movies_key, id).return_movie_data
  end

  def get_game_info(game_name)
    GameData.new(@games_key).return_game_data(game_name)
  end

  def get_book_info(title)
    BookData.new(@books_key, title).return_book_data
  end
end