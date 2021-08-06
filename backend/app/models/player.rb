class Player < ActiveRecord::Base
    belongs_to :league
    belongs_to :fantasy_team

    def goal_involvements
        self.goals + self.assists
    end

    def find_by_path(path)
        id = path.split("/players/")[1].to_i
        self.find_by_id(id)
    end

    def self.get_all_players
        self.all.map { |player| {
        name: player.name,
        position: player.position,
        league: player.league.name, 
        status: player.status,
        goals: player.goals, 
        assists: player.assists,
        saves: player.saves,
        goal_involvements: player.goal_involvements,
        fantasy_team: player.fantasy_team
      }}
    end

end