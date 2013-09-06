class Api::V1::SessionsController < Api::V1::ApplicationController
  respond_to :json
  skip_before_filter :authenticate_session!, only: :show

  def show
    if current_session
      respond_with current_session, api_template: :session, root: 'session'
    else
      #respond_with Session.new, api_template: :session, root: 'session'
      render json: {}, status: 404
    end
  end

  def destroy
    sign_out :session
    render json: {}, status: 200
  end
end
