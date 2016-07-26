# Write your code here!
def game_hash
  {home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1},
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7},
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15},
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5},
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1}
    }},
   away: {
     team_name: "Charlotte Hornets",
     colors: ["Turquoise", "Purple"],
     players: {
       "Jeff Adrien" => {
         number: 4,
         shoe: 18,
         points: 10,
         rebounds: 1,
         assists: 1,
         steals: 2,
         blocks: 7,
         slam_dunks: 2},
       "Bismak Biyombo" => {
         number: 0,
         shoe: 16,
         points: 12,
         rebounds: 4,
         assists: 7,
         steals: 7,
         blocks: 15,
         slam_dunks: 10},
       "DeSagna Diop" => {
         number: 2,
         shoe: 14,
         points: 24,
         rebounds: 12,
         assists: 12,
         steals: 4,
         blocks: 5,
         slam_dunks: 5},
       "Ben Gordon" => {
         number: 8,
         shoe: 15,
         points: 33,
         rebounds: 3,
         assists: 2,
         steals: 1,
         blocks: 1,
         slam_dunks: 0},
       "Brendan Haywood" => {
         number: 33,
         shoe: 15,
         points: 6,
         rebounds: 12,
         assists: 12,
         steals: 22,
         blocks: 5,
         slam_dunks: 12 }}}}
end

def num_points_scored(player)
  if game_hash[:home][:players].has_key?(player)
    game_hash[:home][:players][player][:points]
  else
    game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  if game_hash[:home][:players].has_key?(player)
    game_hash[:home][:players][player][:shoe]
  else
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team)
  if game_hash[:home].has_value?(team)
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  return [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  player_number_array = []
  if game_hash[:home].has_value?(team)
    game_hash[:home][:players].each do |name, stats|
      player_number_array << game_hash[:home][:players][name][:number]
    end
  else
    game_hash[:away][:players].each do |name, stats|
      player_number_array << game_hash[:away][:players][name][:number]
    end
  end
  player_number_array
end

def player_stats(player)
  if game_hash[:home][:players].has_key?(player)
    return game_hash[:home][:players][player]
  else
    return game_hash[:away][:players][player]
  end
end

def big_shoe_rebounds
  big_shoe = 0
  big_shoe_boards = 0
  game_hash[:home][:players].each do |player, stats|
    if game_hash[:home][:players][player][:shoe] > big_shoe
      big_shoe = game_hash[:home][:players][player][:shoe]
      big_shoe_boards = game_hash[:home][:players][player][:rebounds]
  end
end
  game_hash[:away][:players].each do |player, stats|
    if game_hash[:away][:players][player][:shoe] > big_shoe
      big_shoe = game_hash[:away][:players][player][:shoe]
      big_shoe_boards = game_hash[:away][:players][player][:rebounds]
    end
  end
  big_shoe_boards
end

def most_points_scored
  high_score = 0
  big_baller = ""
  game_hash[:home][:players].each do |player, stats|
    if game_hash[:home][:players][player][:points] > high_score
      high_score = game_hash[:home][:players][player][:points]
      big_baller = player
    end
  end
  game_hash[:away][:players].each do |player, stats|
    if game_hash[:away][:players][player][:points] > high_score
      high_score = game_hash[:away][:players][player][:points]
      big_baller = player
    end
  end
  big_baller
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each do |player, stats|
    home_score += game_hash[:home][:players][player][:points]
  end
  game_hash[:away][:players].each do |player, stats|
    away_score += game_hash[:away][:players][player][:points]
  end
  if home_score > away_score
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  player_name = ""
  name_length = 0
  game_hash.each do |location, stuff|
    stuff[:players].each do |player, stats|
      if player.split(//).length > name_length
        name_length = player.split(//).length
        player_name = player
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  long_player_name = ""
  name_length = 0
  game_hash.each do |location, stuff|
    stuff[:players].each do |player, stats|
      if player.split(//).length > name_length
        name_length = player.split(//).length
        long_player_name = player
      end
    end
  end
  steal_fest = 0
  big_steals = ""
  game_hash.each do |location, things|
    things[:players].each do |player1, stats|
      if stats[:steals] > steal_fest
        steal_fest = stats[:steals]
        big_steals = player1
      end
    end
  end
  long_player_name == big_steals
end
