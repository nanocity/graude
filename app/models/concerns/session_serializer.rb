class SessionSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :email, :nick, :name

  has_many :created_tournaments,
    embed: :ids,
    key: :created_tournaments,
    embed_key: :id_param

  has_many :participating_tournaments,
    embed: :ids,
    key: :participating_tournaments,
    embed_key: :id_param
end
