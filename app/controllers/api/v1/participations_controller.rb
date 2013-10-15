class Api::V1::ParticipationsController < Api::V1::ApplicationController
  before_filter :load_tournament, only: [:create]
  authorize_resource :tournament, only: [:create]

  load_resource :participation, except: [:create]
  authorize_resource :participation

  def index
    respond_with @participations
  end

  def show
    respond_with [@participation]
  end

  def create
    @participation = Participation.new
    @participation.create_army_list
    @participation.update_attributes( tournament: @tournament, session: current_session )

    respond_with @participation, location: api_v1_participation_url( @participation )
  end

  def update
    @participation.update_attributes( participation_params )
    respond_with @participation
  end

  def destroy
    @participation.destroy
    render json: @participation
  end

  private
    def load_tournament
      @tournament = Tournament.find( params[:participation].try( :[], :tournament ) || BSON::ObjectId.new )
    end

    def participation_params
      params.require( :participation ).permit( :status )
    end
end
