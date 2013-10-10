class ParticipationSerializer < ActiveModel::Serializer
  attributes :id, :status, :session, :tournament

  def session
    object.session_id.to_param
  end

  def tournament
    object.tournament_id.to_param
  end
end
