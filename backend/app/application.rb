
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/players/) && req.patch?
      player_to_alter = Player.find_by_path(req.path)

      if player_to_alter
        update_data = JSON.parse(req.body.read)
        if player_to_alter.update(update_data)
          return [ 200, {"Content-Type" => "application/json"}, [ {message: "player updated", player: player_to_alter.render_player_info}.to_json ] ]
        else
          return [ 422, {"Content-Type" => "application/json"}, [ {message: "data not valid"}.to_json ] ]
        end
      else 
        return [ 404, {"Content-Type" => "application/json"}, [ {message: "player wasnt found"}.to_json ] ]
      end


    # elsif req.path.match(/fantasy_teams/) && req.patch?  
    #   team_to_alter = FantasyTeam.find_by_path(req.path)
    #   team_to_alter.players.where()
    # #   player_to_alter = Player.find_by_path(req.path)
    # #     # team = FantasyTeam.get_team_from_path(req.path)
    # #     # release = FantasyTeam.remove_player_from_team(req.path)
    # #     # altered_team = FantasyTeam.get_team_from_path(req.path)
    #   if team_to_alter
    #     update_data = JSON.parse(req.body.read)
    #       if player_to_alter.update(update_data)
    #       return [ 200, {"Content-Type" => "application/json"}, [ {message: "player and team updated", fantasy_team: altered_team, player: player_to_alter}.to_json ] ]
    #     elsif
    #       return [ 422, {"Content-Type" => "application/json"}, [ {message: "data not valid"}.to_json ] ]
    #     end 
    #   else 
    #     return [ 404, {"Content-Type" => "application/json"}, [ {message: "player wasnt found"}.to_json ] ]
    #   end


    elsif req.path.match(/fantasy_teams/) && req.delete?
      team_to_delete = FantasyTeam.find_by_path(req.path)
      # if the team to delete is found, its destroyed with the "team_to_delete.destroy" part
      if team_to_delete && team_to_delete.destroy
        return [ 200, {"Content-Type" => "application/json"}, [{message: "team deleted", fantasy_team: team_to_delete}.to_json] ]

        else [ 404, {"Content-Type" => "application/json"}, [{message: "team not found"}.to_json] ] 
      end

    elsif req.path.match(/fantasy_teams/) && req.post?
      hash = JSON.parse(req.body.read)
      # hash should contain info needed to create a new fantasy_team object 
      new_team = FantasyTeam.create(hash)
    
      return [ 200, {"Content-Type" => "application/json"}, [{message: "post successful", fantasy_team: new_team}.to_json]  ]

    elsif req.path.match(/players/) && req.get?
      players = Player.get_all_players

      return [ 200, {"Content-Type" => "application/json"}, [{players: players}.to_json] ]

    elsif req.path.match(/fantasy_teams/) && req.get?
      teams = FantasyTeam.get_all_teams

      return [ 200, {"Content-Type" => "application/json"}, [{teams: teams}.to_json] ]
    
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end
end
