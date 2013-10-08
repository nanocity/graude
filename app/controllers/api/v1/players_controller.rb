class Api::V1::PlayersController < Api::V1::ApplicationController
  load_and_authorize_resource :session, parent: false

  def index
    respond_with @sessions
  end

  def show
    respond_with @session
  end
end
