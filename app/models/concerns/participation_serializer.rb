class ParticipationSerializer < ActiveModel::Serializer
  attributes :id, :status

  has_one :session,
    embed: :ids,
    include: true,
    key: :session,
    embed_key: :id_param

  has_one :tournament,
    embed: :ids,
    include: true,
    key: :tournament,
    embed_key: :id_param

  has_one :army_list,
    embed: :ids,
    include: true,
    key: :army_list,
    embed_key: :id_param
end
