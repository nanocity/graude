class SessionSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :email, :nick, :name

  has_many :created_tournaments,
    embed: :ids,
    include: true,
    key: :created_tournaments,
    root: :tournaments,
    embed_key: :id_param

  has_many :participating_tournaments,
    embed: :ids,
    include: true,
    key: :participating_tournaments,
    root: :tournaments,
    embed_key: :id_param
end
