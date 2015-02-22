class Game < ActiveRecord::Base
	belongs_to :home_team, class: "Team"
	belongs_to :away_team, class: "Team"


	def winner
		if home_team_score > away_team_score
			home_team
		else
			away_team
		end
	end


def matchup
	if home_team_id != nil && away_team_id !=nil
	home = Team.find(home_team_id)
	away = Team.find(away_team_id)
	"#{home.to_s} vs #{away.to_s}"
	else
		"Team ID is missing"
end

end
end
