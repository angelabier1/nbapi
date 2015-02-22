class AddMarketToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :market, :string
  end
end
