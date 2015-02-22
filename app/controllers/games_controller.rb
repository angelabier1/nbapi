class GamesController < ApplicationController
	before_action :find_game, only: [:show, :edit, :update, :destroy]

	def index
		@games = Game.all
  end


	def new
		@game = Game.new
	end

	def create
		@game = Game.create(game_params)
	end

	def show
  end


  def edit
  end

  def update
  end

	def destroy
		@game.destroy
	end

	private

	def find_game
		@game = Game.find(params[:id])
	end

	def game_params
		params.require(:game).permit(:date,:home_team_id, :away_team_id, :home_team_score,:away_team_score, :status)
	end
end
