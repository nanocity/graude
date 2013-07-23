class Api::V1::ApplicationController < ApplicationController
  self.responder = ActsAsApi::Responder

  respond_to :json
end
