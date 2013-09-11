class Api::V1::SessionsController < Api::V1::ApplicationController
  respond_to :json
  skip_before_filter :authenticate_session!, only: :index

  def index
    respond_with [ current_session ].compact, api_template: :session, root: 'sessions'
  end

  def destroy
    sign_out current_session
    respond_with current_session, api_template: :session, root: 'session'
  end
end
