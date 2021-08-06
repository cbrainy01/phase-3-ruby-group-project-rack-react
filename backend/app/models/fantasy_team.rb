class FantasyTeam < ActiveRecord::Base
    has_many :players

    def find_by_path(path)
        id = path.split("/fantasy_teams/")[1].to_i
        self.find_by_id(id)
    end

end