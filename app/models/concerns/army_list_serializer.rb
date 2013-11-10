class ArmyListSerializer < ActiveModel::Serializer
  attributes :id, :list, :updated_at

  has_one :participation,
    embed: :ids,
    key: :participation,
    embed_key: :id_param

  has_many :comments,
    embed: :ids,
    include: true,
    key: :comments,
    embed_key: :id_param
end
