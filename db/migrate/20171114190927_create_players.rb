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
      t.float :aypt
      t.float :racr
      t.float :ms_air_yards 
      t.float :target_share
      t.float :wopr

      t.timestamps
    end
  end
end
