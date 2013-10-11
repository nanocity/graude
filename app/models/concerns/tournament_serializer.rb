class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address, :date, :players_limit

  has_one :creator,
    embed: :ids,
    include: true,
    root: :sessions,
    key: :creator,
    embed_key: :id_param

  has_many :participations,
    embed: :ids,
    include: true,
    key: :participations,
    embed_key: :id_param
end
