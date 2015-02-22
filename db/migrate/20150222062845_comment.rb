class Comment < ActiveRecord::Migration
  def change
	  create_table :comments do |t|
		  t.text :body
		  t.references :game
		  t.timestamps null: false
  end
  end
	end
