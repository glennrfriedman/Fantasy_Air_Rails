class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :index
      t.string :full_name
      t.string :position
      t.string :team
      t.integer :week
      t.integer :tar
      t.integer :rec
      t.integer :rec_yards
      t.integer :yac
      t.integer :air_yards
      t.integer :tm_att
      t.integer :tm_airyards
      t.integer :aypt
      t.integer :racr
      t.integer :ms_air_yards 
      t.integer :target_share
      t.integer :wopr

      t.timestamps
    end
  end
end
