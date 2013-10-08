class ActiveModel::Serializer
  def id
    object.id.to_param
  end
end
