class AddResultToBet < ActiveRecord::Migration
  def change
    add_column :bets, :result, :string
  end
end
