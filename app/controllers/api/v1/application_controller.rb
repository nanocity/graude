class Api::V1::ApplicationController < ApplicationController
  before_filter :authenticate_session!

  respond_to :json

  rescue_from Mongoid::Errors::DocumentNotFound do
    render nothing: true, status: :not_found
  end

  def current_ability
    @current_ability || Ability.new( current_api_v1_session )
  end

  def authenticate_session!
    authenticate_api_v1_session!
  end

  def current_session
    current_api_v1_session
  end
end
