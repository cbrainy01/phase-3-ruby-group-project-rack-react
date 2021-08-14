class FantasyTeam < ActiveRecord::Base
    has_many :players

    def self.find_by_path(path)
        id = path.split("/fantasy_teams/")[1].to_i
        self.find_by_id(id)
    end

    def self.remove_player_from_team(path)
        patched = []
        playerId = path.split("/fantasy_teams/")[1].to_i
        player = Player.where(id: playerId)
        
        patched_team = self.get_team_from_id(playerId)
        patched << patched_team
        player.update(fantasy_team_id: nil, status: "Free Agent")
        patched << player
        patched
    end
    
    def self.get_team_from_path(path)
        playerId = path.split("/fantasy_teams/")[1].to_i
        FantasyTeam.where(player_id: playerId)
    end

    def self.delete_avec_id(playerId)
        patched = []
        playerId = playerId #path.split("/fantasy_teams/")[1].to_i
        player = Player.find_by_id(playerId)
        
        patched_team = self.get_team_from_id(playerId)
        patched << patched_team
        player.update(fantasy_team_id: nil, status: "Free Agent")
        patched << player
        patched
    end

    def self.get_all_teams
        self.all.map { |team| {
            id: team.id,
            name: team.name,
            owner: team.owner,
            roster_count: team.players.length,
            roster: team.players
        } }
    end

end