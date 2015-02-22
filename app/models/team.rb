class Team < ActiveRecord::Base
	has_many :home_games, class_name: "Game", foreign_key: "home_team_id"
	has_many :away_games, class_name: "Game", foreign_key: "away_team_id"
	scope :home_games, ->()

	def to_s
		"#{market} #{name}"
	end

	def games
		Game.where(away_team_id: :id)
		Game.where(home_team_id: :id)
	end


end
