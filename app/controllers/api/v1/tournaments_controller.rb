class Api::V1::TournamentsController < Api::V1::ApplicationController
  def index
    tournaments = Tournament.all
    respond_with tournaments, api_template: :tournament
  end

  def show
    tournament = Tournament.find( params[:id] )
    respond_with tournament, api_template: :tournament
  end

  def create
    tournament = Tournament.create( tournament_params )
    respond_with tournament, api_template: :tournament, location: api_v1_tournament_url( tournament )
  end

  def update
    tournament = Tournament.find( params[:id] )
    tournament.update_attributes( tournament_params )
    respond_with tournament, api_template: :tournament, location: api_v1_tournament_url( tournament )
  end

  def destroy
    tournament = Tournament.find( params[:id] )
    tournament.destroy
    respond_with tournament, api_template: :tournament, location: api_v1_tournament_url( tournament )
  end

  private
    def tournament_params
      params.require( :tournament ).permit( :name, :address, :date )
    end
end
