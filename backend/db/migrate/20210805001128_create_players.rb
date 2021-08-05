class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :image
      t.string :position
      t.string :status
      t.integer :goals
      t.integer :assists
      t.integer :saves
     
      t.belongs_to :league
      t.belongs_to :fantasy_team

      t.timestamps
    end
  end
end
