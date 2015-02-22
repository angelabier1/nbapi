# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SportsDataApi.set_key(:nba, '7qwpn3fch79ncvperz62uxtj')

# teams = SportsDataApi::Nba.teams

#
# teams.each do |team|
# 		   Team.create(name: team.name, alias: team.alias, market: team.market)
# 		     sleep(1)
# end
 Game.delete_all
season = SportsDataApi::Nba.schedule(2014, :REG)

season.games.each do |game|


		box = SportsDataApi::Nba.game_summary(game.id)
		home_team_id = Team.where(name: box.home_team.name).pluck(:id).first
		away_team_id = Team.where(name: box.away_team.name).pluck(:id).first

		Game.create(date: game.scheduled, home_team_id: home_team_id,
		            away_team_id: away_team_id, home_team_score: box.home_team.points,
		            away_team_score: box.away_team.points, status: game.status)
		sleep(1)
	end



# add teams
# add games
# home_team_id = Team.where(name: ).pluck(:id).first
# away_team_id = Team.where(name: ).pluck(:id).first
# Game.create(date: , home_team_id: home_team_id, away_team_id: away_team_id, home_team_score: , away_team_score: )