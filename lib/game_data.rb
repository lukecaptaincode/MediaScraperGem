require 'uri'
require 'net/http'
require 'net/https'
require 'json'
class GameData

  def initialize(api_key)
    @user_key = api_key
  end

  def return_game_data(game_name)
    @req_body = 'search "' + game_name + '";fields age_ratings,aggregated_rating,aggregated_rating_count,
alternative_names,artworks,bundles,category,collection,cover,created_at,dlcs,
expansions,external_games,first_release_date,follows,franchise,franchises,game_engines,
game_modes,genres,hypes,involved_companies,keywords,multiplayer_modes,name,parent_game,
platforms,player_perspectives,popularity,pulse_count,rating,rating_count,release_dates,
screenshots,similar_games,slug,standalone_expansions,status,storyline,summary,tags,
themes,time_to_beat,total_rating,total_rating_count,updated_at,url,version_parent,
version_title,videos,websites;'
    build_query
    @game_data
  end

  def build_query
    http = Net::HTTP.new('api-v3.igdb.com', 80)
    request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), 'user-key' => @user_key)
    request.body = @req_body
    @game_data = http.request(request).body
  end
end