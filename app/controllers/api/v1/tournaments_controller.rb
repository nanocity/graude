class Api::V1::TournamentsController < Api::V1::ApplicationController
  load_resource except: [ :create ]
  authorize_resource

  def index
    respond_with @tournaments
  end

  def show
    respond_with @tournament
  end

  def create
    @tournament = Tournament.new( tournament_params )
    @tournament.creator = current_session
    @tournament.save

    respond_with @tournament, location: api_v1_tournament_url( @tournament )
  end

  def update
    @tournament.update_attributes( tournament_params )
    respond_with @tournament
  end

  def destroy
    @tournament.destroy
    respond_with @tournament
  end

  private
    def tournament_params
      params.require( :tournament ).permit( :name, :description, :address, :date, :coordinates, :players_limit )
    end
end
