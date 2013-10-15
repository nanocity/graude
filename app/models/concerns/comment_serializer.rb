class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :session_name, :session_avatar

  def session_name
    self.object.session.name
  end

  def session_avatar
    self.object.session.avatar
  end
end
