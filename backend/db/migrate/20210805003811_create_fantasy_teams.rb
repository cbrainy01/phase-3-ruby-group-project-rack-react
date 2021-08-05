class CreateFantasyTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :fantasy_teams do |t|
    t.string :name
    t.string :owner

    t.timestamps
    end
  end
end
