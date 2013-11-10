class ParticipationSerializer < ActiveModel::Serializer
  attributes :id, :status

  has_one :session,
    embed: :ids,
    key: :session,
    embed_key: :id_param

  has_one :tournament,
    embed: :ids,
    key: :tournament,
    embed_key: :id_param

  has_one :army_list,
    embed: :ids,
    key: :army_list,
    embed_key: :id_param
end
