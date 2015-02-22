class TeamsController < ApplicationController
	before_action :find_team, only: [:show, :edit, :update, :destroy]

	def index
		@teams = Team.all
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.create(team_params)

	end

	def show

	end


	private

	def find_team
		@team = Team.find(params[:id])

	end


	def team_params
		params.require(:team).permit(:name,:alias,:market)
	end
end
