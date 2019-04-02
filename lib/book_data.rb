class BookData
  def initialize(api_key, title)
    @url = 'https://www.goodreads.com/search/index.xml?key=' + api_key + '&q=' + title
  end

  def return_book_data
    uri = URI(@url)
    Net::HTTP.get(uri)
  end
end