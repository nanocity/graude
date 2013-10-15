class Api::V1::ArmyListsController < Api::V1::ApplicationController
  load_and_authorize_resource :army_list

  def index
    respond_with @army_lists
  end

  def show
    respond_with [@army_list]
  end

  def update
    @army_list.update_attributes( army_list_attributes )

    render json: @army_list
  end

  private
    def army_list_attributes
      params.require( :army_list ).permit( :list )
    end
end
