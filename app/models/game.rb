class Game < ActiveRecord::Base
	belongs_to :home_team, class: "Team"
	belongs_to :away_team, class: "Team"
end
