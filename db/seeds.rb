# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
SportsDataApi.set_key(:nba, SPORTS_DATA_API)

hierarchy = SportsDataApi::Nba.hierarchy
schedule = SportsDataApi::Nba.schedule(2014, :REG)

hierarchy.conferences.each do |conference|
	conference.divisions.each do |division|
	     division.teams.each do |team|
		   Team.create(name: "#{team.market team.name}", alias: team.alias)
		     sleep(1)
	     end
	end
end

schedule.games.each do |game|
		puts "getting data for the game #{game.away.name} at #{game.home.name}"
 		home_team_id = Team.where(alias: game.home.alias).pluck(:id).first
 		away_team_id = Team.where(alias: game.away.alias).pluck(:id).first
 		Game.create(date: game.scheduled, home_team_id: home_team_id,
		            away_team_id: away_team_id, home_team_score: game.home.points,
 		            away_team_score: game.away.points, status: game.status)
 		sleep(1)
 	end



# add teams
# add games
# home_team_id = Team.where(name: ).pluck(:id).first
# away_team_id = Team.where(name: ).pluck(:id).first
# Game.create(date: , home_team_id: home_team_id, away_team_id: away_team_id, home_team_score: , away_team_score: )