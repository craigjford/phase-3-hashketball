require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def concat_players game_hash

  arr = game_hash[:home][:players]  
  all_players_arr = arr.concat(game_hash[:away][:players])

end

def num_points_scored(name)
  points = 0

  all_players_arr = concat_players(game_hash)

  all_players_arr.find do |player|
     if player[:player_name] == name
        points = player[:points]
     end  
  end 

  points
end  

def shoe_size(name)
  sh_sz = 0

  all_players_arr = concat_players(game_hash)

  all_players_arr.find do |player|
     if player[:player_name] == name
        sh_sz = player[:shoe]
     end  
  end 

  return sh_sz 
end 

def team_colors(team_name)
  t_colors = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      t_colors = team_data[:colors]
    end  
  end

  t_colors
end


def team_names()
  name_arr =[]

  game_hash.each do |location, team_data|
    name_arr << team_data[:team_name]
  end

  name_arr
end

def player_numbers(teams_name)

  jersey_array = []
  t_players = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == teams_name
      t_players = game_hash[location][:players]
      t_players.each do |player|
        jersey_array.push(player[:number])
      end 
    else  
      if team_data[:team_name] == teams_name
        t_players = game_hash[location][:players]
        t_players.each do |player|
          jersey_array.push(player[:number]) 
        end  
      end        
    end
  end  

  jersey_array
end

def player_stats(pl_name)
  pl_stats = {}

  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:player_name].upcase == pl_name.upcase
        pl_stats = player
      end  
    end  
  end  

  pl_stats
  
end


def big_shoe_rebounds

  rebounds = 0
  shoe_size = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > shoe_size
         shoe_size = player[:shoe]
         rebounds = player[:rebounds]
      end  
    end  
  end  

  rebounds

end

# stats = big_shoe_rebounds
# binding.pry
# 0

# def team_names(team_name)
#   bind
#   game_hash.each do |location, team_data|
#     binding.pry
#     team_data.each do |attribute, data|
#       binding.pry
#       data.each do |data_item|
#         binding.pry   
#       end
#     end
#   end
# end

# pl_pts = num_points_scored("Ben Gordon")



