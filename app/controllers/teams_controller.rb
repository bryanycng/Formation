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
		params.require(:team).permit(:players => [])
		@team = Team.find(params[:id])
		@players = params[:team][:players] 
		@players.each do |player|
			next if Player.find_by(file: player + ".png").nil? == true
			@team.players << Player.find_by(file: player +".png")
		end
		redirect_to @team
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
