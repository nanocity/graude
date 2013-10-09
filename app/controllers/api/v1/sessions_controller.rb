class Api::V1::SessionsController < Api::V1::ApplicationController
  respond_to :json
  skip_before_filter :authenticate_session!, only: :index

  def index
    respond_with [current_session].compact
  end

  def destroy
    sign_out current_session
    respond_with current_session
  end
end
