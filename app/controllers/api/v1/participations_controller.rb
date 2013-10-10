class Api::V1::ParticipationsController < Api::V1::ApplicationController
  load_and_authorize_resource :tournament
  load_and_authorize_resource :participation, through: :tournament

  def index
    respond_with @participations
  end

  def show
    respond_with @participation
  end

  def create
    @participation.create_army_list
    @participation.update_attributes( tournament: @tournament, session: current_session )

    respond_with @participation, location: api_v1_tournament_participation_url( @tournament, @participation )
  end

  def update
    @participation.update_attributes( participation_params )
    respond_with @participation
  end

  def destroy
    @participation.destroy
    respond_with @participation
  end

  private
    def participation_params
      params.require( :participation ).permit( :status )
    end
end
