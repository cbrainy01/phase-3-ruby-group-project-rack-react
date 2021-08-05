class Player < ActiveRecord::Base
    belongs_to :league
    belongs_to :fantasy_team

    def goal_involvements
        self.goals + self.assists
    end
end