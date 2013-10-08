class SessionSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :email, :nick, :name
end
