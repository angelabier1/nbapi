class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team
      t.integer :away_team
      t.integer :home_team_score
      t.integer :away_team_score
      t.datetime :date

      t.timestamps null: false
    end
  end
end
