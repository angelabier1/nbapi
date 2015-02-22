class BetsController < ApplicationController
	before_action :authenticate_user!

	def index
		@bets = current_user.bets
	end

	def new

	end

	def create
		@game = Game.find(params[:game_id])
		@bet = @game.bets.build(params[:bet])
		@bet.user = User.find(current_user.id)
		respond_to do |format|
			if @bet.save
				format.html { redirect_to(@comment.game, :notice => 'Comment was successfully created.') }
			else
				format.html { render :action => "new" }
			end
		end
	end
	end

