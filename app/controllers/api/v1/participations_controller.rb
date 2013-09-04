class ParticipationsController < Api::V1::ApplicationController
  load_and_authorize_resource :tournament
  load_and_authorize_resource :participation, through: :tournament

  def create
    Participantion.create( tournament: @tournament, player: current_session )
  end
end
