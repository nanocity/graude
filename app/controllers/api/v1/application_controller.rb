class Api::V1::ApplicationController < ApplicationController
  self.responder = ActsAsApi::Responder

  before_filter :authenticate_session!

  respond_to :json

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
