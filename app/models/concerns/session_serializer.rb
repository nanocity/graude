class SessionSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :email, :nick, :name

  has_many :created_tournaments,
    embed: :ids,
    include: true,
    key: :tournaments,
    root: :tournaments,
    embed_key: :id_param
end
