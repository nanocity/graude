class Api::V1::PlayersController < Api::V1::ApplicationController
  load_and_authorize_resource :session, parent: false

  def index
    respond_with @sessions, each_serializer: PlayerSerializer
  end

  def show
    respond_with @session, serializer: PlayerSerializer
  end
end
