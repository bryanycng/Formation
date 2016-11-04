class TeamsController < ApplicationController
	
	def index
    	@teams = Team.all
  	end

	def show
    	@team = Team.find(params[:id])
  	end

	def new
		if !logged_in?
      		flash[:danger] = "Not logged in"
      		redirect_to login_path
      	end
		@team = Team.new
	end

	def edit
  		@team = Team.find(params[:id])
	end

	def create
  		@team = Team.new(team_params)
  		@team.user = current_user
 
	  	if @team.save
  			redirect_to @team
		else 
			render 'new'
		end
	end

	def update
  		@team = Team.find(params[:id])

  		if @team.update(team_params)
   			redirect_to @team
  		else
    	render 'edit'
  		end
	end

	def add_players
		params.require(:team).permit(:player)
		@team = Team.find(params[:id])
		@players = params:players
		@team.players << @players
		@players.each do |player|
   			@player.teams << @team
		end
		
	end


	def destroy
   		@team = Team.find(params[:id])
   		@team.destroy
 
    	redirect_to teams_path
  	end

	private 
		def team_params
			params.require(:team).permit(:title, :text)
		end
end
