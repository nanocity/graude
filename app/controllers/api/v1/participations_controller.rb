class Api::V1::ParticipationsController < Api::V1::ApplicationController
  load_and_authorize_resource :tournament
  load_and_authorize_resource :participation, through: :tournament

  def index
    respond_with @participations, api_template: :participation
  end

  def show
    respond_with @participation, api_template: :participation
  end

  def create
    @participation.update_attributes( tournament: @tournament, session: current_session )
    respond_with @participation, api_template: :participation, location: api_v1_participation_url( @participation )
  end
end
