class CommentsController < ApplicationController
	before_action :find_comment, only: [:show, :edit, :update, :destroy]
	before_action authenticate_user!, except: [:index, :show]

	def index
		@comments = Comment.all
	end


	def new

	end

	def create
		@game = Game.find(params[:game_id])
		@comment = @game.comments.build(params[:comment])
		@comment.user = User.find(current_user.id)
		respond_to do |format|
			if @comment.save
				format.html { redirect_to(@comment.game, :notice => 'Comment was successfully created.') }
			else
				format.html { render :action => "new" }
			end
		end
	end

	def show

	end

	def edit

	end




	def update
		if @comment.user == current_user
			@comment.update
			respond_to do |format|
				format.html {redirect_to game_comments_url,notice:'Comment was successfully updated.'}
				format.json { head :ok}
			end
		else
			redirect_to edit_game_comment_path
		end
	end

	def destroy
		if @comment.user == current_user
			@comment.destroy
			respond_to do |format|
				format.html {redirect_to game_comments_url,notice:'Comment was successfully deleted.'}
				format.json { head :ok}
			end
		else
			redirect_to game_comments_path
		end
	end

	private

	def find_comment
		@comment = Comment.find(params[:id])
	end


	def comment_params
		params.require(:comment).permit(:body)
	end

	end
