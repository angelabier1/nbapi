class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.references :user, index: true
      t.integer :amount

      t.timestamps null: false
    end
    add_foreign_key :bets, :users
  end
end
