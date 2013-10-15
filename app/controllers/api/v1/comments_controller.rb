class Api::V1::CommentsController < Api::V1::ApplicationController
  before_filter :load_army_list
  authorize_resource through: :army_list

  def create
    comment = Comment.new( comment_params )
    comment.session = current_session
    @army_list.comments.push( comment )
    @army_list.save

    respond_with @army_list, serializer: ArmyListSerializer, location: api_v1_army_list_url( @army_list )
  end

  private
    def load_army_list
      @army_list = ArmyList.find( params[:comment].try( :[], :army_list ) || BSON::ObjectId.new )
    end

    def comment_params
      params.require( :comment ).permit( :body )
    end

end
