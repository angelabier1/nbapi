class AddSelectedTeamToBet < ActiveRecord::Migration
  def change
    add_column :bets, :selected_team, :integer
  end
end
