class Api::V1::PlayersController < Api::V1::ApplicationController
  def index
    players = Session.all
    respond_with players, api_template: :session, root: 'players'
  end

  def show
    player = Session.find( params[:id] )
    respond_with player, api_template: :session, root: 'player'
  end
end
