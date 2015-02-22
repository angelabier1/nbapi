class Bet < ActiveRecord::Base
  belongs_to :user
	belongs_to :game

end
# Bet belongs to a user
# Bet belongs to a game
# User selects winner, so a bet can only have one selected_team