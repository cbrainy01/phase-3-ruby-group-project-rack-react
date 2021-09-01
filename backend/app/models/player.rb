class Player < ActiveRecord::Base
    belongs_to :league
    belongs_to :fantasy_team


    def self.assist_masters
        self.where("assists > 10")
    end

    def goal_involvements
        self.goals + self.assists 
    end

    def self.find_by_path(path)
        id = path.split("/players/")[1].to_i
        self.find_by_id(id)
    end

    def self.find_by_fantasy_team_path(path)
        id = path.split("/fantasy_teams")[1].to_i
        self.find_by_id(id)
    end

    def self.get_all_players
        self.all.map { |player| player.render_player_info }
    #     self.all.map { |player| {
    #     id: player.id,
    #     name: player.name,
    #     image: player.image,
    #     position: player.position,
    #     league: player.league, 
    #     status: player.status,
    #     goals: player.goals, 
    #     assists: player.assists,
    #     saves: player.saves,
    #     goal_involvements: player.goal_involvements,
    #     fantasy_team: player.fantasy_team
    #   }}
    end

    def render_player_info
        {
            id: self.id,
            name: self.name,
            image: self.image,
            position: self.position,
            league: self.league, 
            status: self.status,
            goals: self.goals, 
            assists: self.assists,
            saves: self.saves,
            goal_involvements: self.goal_involvements,
            fantasy_team: self.fantasy_team
        }
    end
end